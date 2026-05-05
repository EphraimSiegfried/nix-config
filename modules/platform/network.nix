{
  flake.modules.nixos.network =
    { pkgs, ... }:
    {
      networking.networkmanager = {
        enable = true;
        plugins = [ pkgs.networkmanager-openconnect ];
      };
    };

  flake.modules.homeManager.hyprland =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.networkmanagerapplet ];
    };
}
