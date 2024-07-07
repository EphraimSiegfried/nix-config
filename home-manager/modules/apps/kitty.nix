{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    font = {
      name = "FiraCode";
      size = 15;
    };
    settings = {
      background_opacity = "0.8";
    };

    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
    };
  };
}
