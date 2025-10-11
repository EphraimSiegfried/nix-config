{
  wayland.windowManager.hyprland.enable = true;

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    NIXOS_OZONE_WL = 1;
    QT_QPA_PLATFORM = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XCURSOR_SIZE = 128;
  };

  wayland.windowManager.hyprland.settings = {

    "$mod" = "SUPER";
    bind =
      let
        terminal = "kitty";
        browser = "firefox";
        menu = "anyrun";
      in
      [
        "ALTSHIFT, K, exec, ${terminal}"
        "ALTSHIFT, B, exec, ${browser}"
        "ALT, space, exec, ${menu}"

        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

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
}
