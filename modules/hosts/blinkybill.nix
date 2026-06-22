{
  inputs,
  config,
  ...
}:
{
  flake.nixosConfigurations.blinkybill = inputs.nixpkgs.lib.nixosSystem {
    modules = with inputs.self.modules.nixos; [
      base
      bluetooth
      audio
      keyboard
      amdgpu
      kernel

      hyprland
      secrets
      gui_apps
      virtualisation

      {
        imports = [
          ../platform/_generated/hardware-configuration.nix
          inputs.home-manager.nixosModules.default
        ];
        networking.hostName = "blinkybill";
        home-manager.backupFileExtension = "hm-backup";
        home-manager.users.${config.primaryUser.username} = {
          imports = with inputs.self.modules.homeManager; [
            base
            gui_apps
            noctalia
            secrets
          ];
        };
      }
    ];
  };
}
