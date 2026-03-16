{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {
      input = {
        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.3;
        };
      };

      gesture = [
        "3, horizontal, workspace"
      ];
    };
  };
}
