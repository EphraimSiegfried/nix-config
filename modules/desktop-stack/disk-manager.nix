{

  flake.modules.homeManager.hyprland = {
    services.udiskie = {
      enable = true;
      notify = true;
      settings = {
        device_config = [
          { device_file = "/dev/sda2"; ignore = true; }
        ];
      };
    };
  };
  flake.modules.nixos.hyprland = {
    services.udisks2.enable = true;
  };
}
