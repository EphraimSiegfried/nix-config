# This file is the root and defines the configuration for all my systems

{
  inputs,
  config,
  ...
}:
let
  nixosDefaults.system.stateVersion = "25.11";
  darwinDefaults.system.stateVersion = 6;
  homeDefaults.home.stateVersion = "23.05";
in
{
  # Supported systems
  systems = [
    "x86_64-linux"
    "aarch64-darwin"
  ];

  # System configuration for MacOS
  flake.darwinConfigurations.thymian = inputs.darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = with inputs.self.modules.darwin; [
      # the list of features (i.e. modules) I want to have on my mac
      darwinDefaults
      user
      system_defaults
      nix_settings
      cli_tools
      gui_apps
      window_manager
      status_bar
    ];
  };

  # Home configuration for MacOS
  # TODO: Use home-manager as a darwin module
  flake.homeConfigurations."${config.primaryUser.username}@thymian" =
    inputs.home-manager.lib.homeManagerConfiguration
      {
        pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
        modules = with inputs.self.modules.homeManager; [
          homeDefaults
          user
          nixpkgs_settings
          sketchybar
          fonts
          cli_tools
          gui_apps
          secrets
        ];

      };

  # System configuration for NixOS
  flake.nixosConfigurations.blinkybill = inputs.nixpkgs.lib.nixosSystem {
    modules = with inputs.self.modules.nixos; [
      nixosDefaults

      nix_settings
      user

      kernel
      systemd_boot

      network
      bluetooth
      audio
      keyboard
      amdgpu

      hyprland
      login

      fonts
      # TODO: handle hardware configuration in a more elegant way
      {
        imports = [
          ./platform/_generated/hardware-configuration.nix
          inputs.home-manager.nixosModules.default
        ];
        networking.hostName = "blinkybill";
        # Here home-manager is used as a nixos module
        # This has the advantage I only need nixos-rebuild to change both system and home settings
        home-manager.users.${config.primaryUser.username} = {
          imports = with inputs.self.modules.homeManager; [
            homeDefaults
            user
            nixpkgs_settings
            fonts
            cli_tools
            gui_apps
            launcher
          ];
        };
      }
    ];
  };

  flake.nixosConfigurations.oz = inputs.nixpkgs.lib.nixosSystem {
    modules = with inputs.self.modules.nixos; [
      nixosDefaults

      nix_settings
      user

      kernel
      systemd_boot

      network
      bluetooth
      audio
      keyboard

      hyprland
      login

      fonts
      # TODO: handle hardware configuration in a more elegant way
      {
        imports = [
          ./platform/_generated/oz.nix
          inputs.home-manager.nixosModules.default
        ];
        networking.hostName = "oz";
        # Here home-manager is used as a nixos module
        # This has the advantage I only need nixos-rebuild to change both system and home settings
        home-manager.users.${config.primaryUser.username} = {
          imports = with inputs.self.modules.homeManager; [
            homeDefaults
            user
            nixpkgs_settings
            fonts
            cli_tools
            gui_apps
          ];
        };
      }
    ];
  };

  # Here I use home manager as a standalone module
  # This can be used for systems without nixos installed
  flake.homeConfigurations."${config.primaryUser.username}" =
    inputs.home-manager.lib.homeManagerConfiguration
      {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        modules = with inputs.self.modules.homeManager; [
          homeDefaults
          nixpkgs_settings
          fonts
          cli_tools
          secrets
        ];
      };
}
