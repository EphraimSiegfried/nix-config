{
  flake.modules.nixos.desktop_services = {
    services.udisks2.enable = true;
  };

  flake.modules.homeManager.desktop_services =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.networkmanagerapplet ];

      services.hyprpolkitagent.enable = true;

      home.pointerCursor = {
        enable = true;
        hyprcursor = {
          enable = true;
          size = 60;
        };
        package = pkgs.vanilla-dmz;
        name = "Vanilla-DMZ";
      };

      services.udiskie = {
        enable = true;
        notify = true;
        settings = {
          device_config = [
            {
              device_file = "/dev/sda2";
              ignore = true;
            }
          ];
        };
      };
    };
}
