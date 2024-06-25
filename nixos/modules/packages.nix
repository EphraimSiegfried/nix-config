{ pkgs, config, lib, ... }: {

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    neovim
    git
    kitty
    spotify
    git
  ];
  programs.zsh.enable = true;
  programs.firefox.enable = true;
}
