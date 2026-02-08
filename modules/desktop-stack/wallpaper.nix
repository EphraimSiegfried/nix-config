{ self, ... }:
{
  flake.modules.homeManager.hyprland = {
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;
        preload = [
          "${self}/wallpapers/clouds.png"
        ];
        wallpaper = [
          ", ${self}/wallpapers/clouds.png"
        ];
      };
    };
  };
}
