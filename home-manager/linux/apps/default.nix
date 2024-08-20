{ pkgs, ... }: {
  # home-manager
  home.packages = with pkgs; [
    jq
    drawio
  ];

  imports = [
    ./spotify.nix
    ./firefox.nix
  ];

}
