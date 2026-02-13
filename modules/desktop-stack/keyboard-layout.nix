{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {
      input = {
        kb_layout = "us,ch";
        kb_variant = ",de";
        kb_options = "grp:rctrl_toggle";
      };
    };
  };
}
