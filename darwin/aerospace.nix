{
  services.aerospace = {
    enable = true;
    settings = {
      mode.main.binding = {
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";
        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";
        alt-tab = "workspace-back-and-forth";
        alt-f = "fullscreen";
        alt-shift-f = "fullscreen --no-outer-gaps";
        cmd-f = "macos-native-fullscreen";
        alt-shift-minus = "resize smart -50";
        alt-shift-equal = "resize smart +50";
        alt-shift-semicolon = "mode service";
      };
      mode.service.binding =
        {
          alt-shift-h = [ "join-with left" "mode main" ];
          alt-shift-j = [ "join-with down" "mode main" ];
          alt-shift-k = [ "join-with up" "mode main" ];
          alt-shift-l = [ "join-with right" "mode main" ];
          backspace = [ "close-all-windows-but-current" "mode main" ];
        };
      exec-on-workspace-change = [ "/bin/bash" "-c" "/usr/local/bin/sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE" ];
      gaps = {
        outer = {
          left = 8;
          bottom = 8;
          top = 32;
          right = 8;
        };
        inner = {
          horizontal = 8;
          vertical = 8;
        };

      };
    };
  };
}
