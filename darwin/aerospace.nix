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
          # cmd-f = "macos-native-fullscreen";
          alt-shift-minus = "resize smart -50";
          alt-shift-equal = "resize smart +50";
          alt-shift-semicolon = "mode service";
          # FIX: don't hardcode executable paths
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
      # exec-on-workspace-change = [ "/bin/bash" "-c" "/run/current-system/sw/bin/sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE" ];
      exec-on-workspace-change = [
        "/bin/bash"
        "-c"
        "${sketchybar} --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE"
      ];
      gaps = {
        outer = {
          left = 10;
          bottom = 10;
          top = 20;
          right = 10;
        };
        inner = {
          horizontal = 10;
          vertical = 10;
        };

      };
    };
  };
}
