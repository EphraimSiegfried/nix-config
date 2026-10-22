{
  inputs,
  config,
  ...
}:
{
  flake.nixosConfigurations.oz = inputs.nixpkgs.lib.nixosSystem {
    modules = with inputs.self.modules.nixos; [
      base
      bluetooth
      audio
      keyboard-macbook
      graphics

      hyprland
      gui_apps

      {
        imports = [
          ../platform/_generated/oz.nix
          inputs.home-manager.nixosModules.default
          inputs.nixos-hardware.nixosModules.apple-macbook-pro-11-5
        ];
        networking.hostName = "oz";
        home-manager.backupFileExtension = "bak";
        services.upower.enable = true;
        boot.kernelParams = [ "radeon.runpm=0" "radeon.dpm=0" ];
        home-manager.users.${config.primaryUser.username} = {
          imports = with inputs.self.modules.homeManager; [
            base
            gui_apps
            noctalia_laptop
          ];
          wayland.windowManager.hyprland.settings.monitor = [
            ",preferred,auto,2"
          ];
        };
      }
    ];
  };
}
