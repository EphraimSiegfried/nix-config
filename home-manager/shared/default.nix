{ pkgs, ... }: {
  # home-manager
  home.packages = with pkgs; [
    jq
    #    drawio
  ];

  imports = [
    ./git.nix
    ./zsh.nix
    ./tmux.nix
    ./yazi.nix
    ./kitty.nix
    ./sioyek.nix
    ./nixvim
    ./fonts.nix
    ./sops.nix
  ];

}
