{ pkgs, ... }:
{
  # home-manager
  home.packages = with pkgs; [
    jq
    drawio
    brave
    protonvpn-gui
  ];

  imports = [
    ./spotify.nix
    ./firefox.nix
    # ./nextcloud.nix
  ];

}
