{
  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {

    "$mod" = "SUPER";
    bind =
      let
        terminal = "kitty";
        browser = "firefox";
        menu = "wofi --normal-window --show drun --terminal kitty --allow-images --lines 10";
      in
      [
        "ALTSHIFT, K, exec, ${terminal}"
        "ALTSHIFT, B, exec, ${browser}"
        "ALT, space, exec, ${menu}"

        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        # "$mod, SHIFT, H, swapwindow, l"
        # "$mod, SHIFT, L, swapwindow, r"
        # "$mod, SHIFT, K, swapwindow, u"
        # "$mod, SHIFT, J, swapwindow, d"

        "$mod, TAB, focuscurrentorlast"

        "ALT, Q, killactive"
        "$mod, F, fullscreen"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList
          (
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
          )
          10)
      );
  };
}
