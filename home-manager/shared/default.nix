{ pkgs, ... }:
{
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
    ./sioyek.nix
    ./packages.nix
    ./latex.nix
    ./nh.nix
  ];

}
