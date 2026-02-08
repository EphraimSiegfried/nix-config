# TODO: Refactor
{
  flake.modules.homeManager.hyprland = {

    wayland.windowManager.hyprland.settings = {

      "$mod" = "SUPER";
      bind =
        let
          terminal = "kitty";
          browser = "brave";
          menu = "vicinae toggle";
        in
        [
          "ALTSHIFT, T, exec, ${terminal}"
          "ALTSHIFT, B, exec, ${browser}"
          "ALT, space, exec, ${menu}"

          "$mod, H, movefocus, l"
          "$mod, L, movefocus, r"
          "$mod, K, movefocus, u"
          "$mod, J, movefocus, d"

          "ALTSHIFT, L, resizeactive, 30 0"
          "ALTSHIFT, H, resizeactive, -30 0"
          "ALTSHIFT SHIFT, J, resizeactive, 0 30"
          "ALTSHIFT SHIFT, K, resizeactive, 0 -30"

          "$mod SHIFT, H, swapwindow, l"
          "$mod SHIFT, L, swapwindow, r"
          "$mod SHIFT, K, swapwindow, u"
          "$mod SHIFT, J, swapwindow, d"

          "$mod, S, exec, grim - | wl-copy"
          "$mod SHIFT, S, exec, grim -g \"$(slurp)\" | wl-copy"

          "$mod, TAB, focuscurrentorlast"

          "ALT, Q, killactive"
          "ALT, W, killactive"
          "$mod, F, fullscreen"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (
            builtins.genList (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            ) 10
          )
        );
    };
  };

  flake.modules.darwin.aerospace =
    { lib, pkgs, ... }:
    let
      sketchybar = "${pkgs.sketchybar}/bin/sketchybar";
      aerospace = "${pkgs.aerospace}/bin/aerospace";

      genLisz = func: builtins.tail (builtins.genList (x: func (toString x)) 10);
      genEnd = str: genLisz (x: "${str}${x}");

      mkAttrSet =
        keys: values: lib.listToAttrs (lib.zipListsWith (name: value: { inherit name value; }) keys values);
    in
    {
      services.aerospace = {
        enable = true;
        settings = {
          mode.main.binding =

            mkAttrSet (genEnd "alt-") (genEnd "workspace ")
            // mkAttrSet (genEnd "alt-shift-") (
              genLisz (x: [
                "move-node-to-workspace ${x}"
                "exec-and-forget ${sketchybar} --trigger change_window_workspace TARGET_WORKSPACE=${x} FOCUSED_WORKSPACE=$(${aerospace} list-workspaces --focused)"
              ])
            )
            // {
              alt-h = "focus left";
              alt-j = "focus down";
              alt-k = "focus up";
              alt-l = "focus right";
              alt-shift-h = "move left";
              alt-shift-j = "move down";
              alt-shift-k = "move up";
              alt-shift-l = "move right";
              alt-tab = "workspace-back-and-forth";
              alt-f = "fullscreen";
              alt-shift-f = "fullscreen --no-outer-gaps";
              alt-shift-minus = "resize smart -50";
              alt-shift-equal = "resize smart +50";
              alt-shift-semicolon = "mode service";
              # TODO: don't hardcode executable paths
              shift-cmd-k = "exec-and-forget ${lib.getExe pkgs.kitty} --single-instance -d ~";
              shift-cmd-s = "exec-and-forget open /Applications/Spotify.app";
              shift-cmd-b = "exec-and-forget open -n '/Applications/Brave Browser.app'";

            };
          mode.service.binding = {
            alt-shift-h = [
              "join-with left"
              "mode main"
            ];
            alt-shift-j = [
              "join-with down"
              "mode main"
            ];
            alt-shift-k = [
              "join-with up"
              "mode main"
            ];
            alt-shift-l = [
              "join-with right"
              "mode main"
            ];
            backspace = [
              "close-all-windows-but-current"
              "mode main"
            ];
          };
        };
      };
    };
}
