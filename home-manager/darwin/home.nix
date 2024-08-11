# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {
  # You can import other home-manager modules here
  imports = [
    ../shared
  ];

  fonts.fontconfig.enable = true;

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "siegi";
    homeDirectory = "/Users/siegi";
    sessionVariables = {
      NIXOS_CONFIG = "~/nix-config/";
    };

    file.".config/sketchybar" = {
      source = ./sketchybar;
      recursive = true;
    };

    file."Pictures/screenshots/.keep".text = "";
  };

  home.packages = with pkgs; [
    sketchybar-app-font
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.firefox.package = pkgs.firefox-bin;


  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
