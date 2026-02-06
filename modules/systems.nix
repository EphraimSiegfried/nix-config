# This file is the root and defines the configuration for all my systems

{
  inputs,
  config,
  ...
}:
let
  darwinDefaults = {
    system.stateVersion = 6;
  };
  # sets home manager defaults
  homeDefaults =
    { pkgs, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      hasSuffix = pkgs.lib.hasSuffix;
      # linux and macos have different home directory names
      homeDir = if hasSuffix "linux" system then "/home" else "/Users";
    in
    {
      home.stateVersion = "23.05";
      home.username = config.primaryUser;
      home.homeDirectory = "${homeDir}/${config.primaryUser}";
    };
in
{
  systems = [
    "x86_64-linux"
    "aarch64-darwin"
  ];

  # System configuration for MacOS
  flake.darwinConfigurations.thymian = inputs.darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = with inputs.self.modules.darwin; [
      # the list of features I want to have on my mac
      darwinDefaults
      system_defaults
      nix_settings
      cli_tools
      gui_apps
      window_manager
      status_bar
    ];
  };

  # Home configuration for MacOS
  flake.homeConfigurations."${config.primaryUser}@thymian" =
    inputs.home-manager.lib.homeManagerConfiguration
      {
        pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
        modules = with inputs.self.modules.homeManager; [
          homeDefaults
          status_bar
          fonts
          cli_tools
          gui_apps
          secrets
          zsh
        ];

      };

}
