{ config, ... }:
{
  flake.modules.darwin.nix_settings = {

    nix.settings = {
      "extra-experimental-features" = [
        "nix-command"
        "flakes"
        "ca-derivations"
        "git-hashing"
        "pipe-operators"
      ];
      trusted-users = [
        "root"
        config.primaryUser
      ];
    };
  };
}
