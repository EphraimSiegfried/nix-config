{ pkgs, ... }:
{
  # home-manager
  home.packages = with pkgs; [
    jq
    drawio
    brave
  ];

  imports = [
    ./spotify.nix
    ./firefox.nix
    # ./nextcloud.nix
  ];

}
