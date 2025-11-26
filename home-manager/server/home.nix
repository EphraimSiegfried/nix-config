{
  outputs,
  ...
}:
{
  imports = [
    ../shared/zsh
    ../shared/nixvim
    ../shared/git.nix
    ../shared/fonts.nix
    ../shared/tmux.nix
    ../shared/packages.nix
  ];
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "siegi";
    homeDirectory = "/home/siegi";
    sessionVariables = {
      NIXOS_CONFIG = "~/nix-config/";
    };
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.05";
}
