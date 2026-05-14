{
  flake.modules.nixos.network =
    { pkgs, ... }:
    {
      networking.networkmanager = {
        enable = true;
        plugins = [ pkgs.networkmanager-openconnect ];
      };
    };

}
