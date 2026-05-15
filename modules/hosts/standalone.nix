{
  inputs,
  config,
  ...
}:
{
  # Standalone home-manager for non-NixOS Linux systems
  flake.homeConfigurations."${config.primaryUser.username}" =
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      modules = with inputs.self.modules.homeManager; [
        base
        secrets
      ];
    };
}
