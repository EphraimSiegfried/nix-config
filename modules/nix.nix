# Defines default settings for the nix package manager
{ config, ... }:
let
  nixSettings = {
    "extra-experimental-features" = [
      "nix-command"
      "flakes"
      "ca-derivations"
      "git-hashing"
      "pipe-operators"
    ];
    trusted-users = [
      "root"
      config.primaryUser.username
    ];
  };

  nixGc = {
    automatic = true;
    # dates = "weekly";
    options = "--delete-older-than 30d";
  };
in
{
  flake.modules.darwin.nix_settings = {
    nix.settings = nixSettings;
    nix.gc = nixGc;
  };

  flake.modules.nixos.nix_settings = {
    nix.settings = nixSettings;
    nix.gc = nixGc;
  };
}
