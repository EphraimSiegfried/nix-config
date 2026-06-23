{ inputs, ... }:
{
  flake.modules.nixos.base = {
    system.stateVersion = "25.11";
    programs.nix-ld.enable = true;
    imports = with inputs.self.modules.nixos; [
      nix_settings
      nixpkgs_settings
      user
      systemd_boot
      fonts
      network
    ];
  };

  flake.modules.homeManager.base = {
    home.stateVersion = "23.05";
    imports = [
      inputs.noctalia.homeModules.default
    ]
    ++ (with inputs.self.modules.homeManager; [
      user
      nixpkgs_settings
      fonts
      cli_tools
    ]);
  };
}
