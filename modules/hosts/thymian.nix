{
  inputs,
  config,
  ...
}:
{
  flake.darwinConfigurations.thymian = inputs.darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = with inputs.self.modules.darwin; [
      { system.stateVersion = 6; }
      user
      system_defaults
      nix_settings
      cli_tools
      gui_apps
      window_manager
      status_bar
      login
      linux-builder

      {
        imports = [
          inputs.home-manager.darwinModules.home-manager
        ];
        home-manager.users.${config.primaryUser.username} = {
          imports = with inputs.self.modules.homeManager; [
            base
            gui_apps
            secrets
          ];
        };
      }
    ];
  };
}
