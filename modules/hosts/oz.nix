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
        ];
        networking.hostName = "oz";
        home-manager.users.${config.primaryUser.username} = {
          imports = with inputs.self.modules.homeManager; [
            base
            gui_apps
          ];
        };
      }
    ];
  };
}
