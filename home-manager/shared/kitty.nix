{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "FiraCode";
      size = 15;
    };
    settings = {
      background_opacity = "0.8";
      background_blur = 1;
      hide_window_decorations = "yes";
    };

    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
    };
  };
}
