{ pkgs, ... }: {
  # home-manager
  home.packages = with pkgs; [
    jq
    drawio
  ];

  imports = [
    ./git.nix
    ./zsh.nix
    ./tmux.nix
    ./yazi.nix
    ./kitty.nix
    ./sioyek.nix
    ./zathura.nix
    ./firefox.nix
    ./nixvim
    ./vscode.nix
  ];

}
