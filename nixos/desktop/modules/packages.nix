{ pkgs, config, lib, ... }: {

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    neovim
    git
    kitty
    spotify
    discord
    webcord
    git
  ];
  programs.zsh.enable = true;
  programs.firefox.enable = true;
}
