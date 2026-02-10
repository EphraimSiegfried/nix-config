{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {
      input = {
        touchpad = {
          natural_scroll = true;
        };
      };

      gesture = [
        "3, horizontal, workspace"
      ];
    };
  };
}
