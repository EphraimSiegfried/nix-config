# This is your home-manager configuration file
{ outputs, ... }:
{
  imports = [
    ../shared
    ./desktop
    ./apps
  ];
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "siegi";
    homeDirectory = "/home/siegi";
    sessionVariables = {
      NIXOS_CONFIG = "~/nix-config/";
    };
  };
  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
