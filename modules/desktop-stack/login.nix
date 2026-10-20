{ inputs, lib, ... }:
{
  flake.modules.nixos.login = {
    imports = [
      "${inputs.nixpkgs-unstable}/nixos/modules/services/display-managers/noctalia-greeter.nix"
    ];

    options.security.polkit.enablePkexecWrapper = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };

    config.services.displayManager.noctalia-greeter = {
      enable = true;
      settings.keyboard = {
        layout = "us,ch";
        variant = ",de";
        options = "grp:win_space_toggle";
      };
    };
  };
}
