{ pkgs, ... }:
{
  # home-manager
  home.packages = with pkgs; [
    jq
    #    drawio
  ];

  imports = [
    ./git.nix
    ./ssh.nix
    ./zsh
    ./tmux.nix
    ./yazi.nix
    ./kitty.nix
    ./sioyek.nix
    ./nixvim
    ./fonts.nix
    ./zathura.nix
    ./direnv.nix
  ];

}
