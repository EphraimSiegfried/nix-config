{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = [
        "~/nix-config/wallpapers/clouds.png"
      ];
      wallpaper = [
        ", ~/nix-config/wallpapers/clouds.png"
      ];
    };
  };
}
