{ pkgs, ... }:
{
  # home-manager
  home.packages = with pkgs; [
    jq
    drawio
    brave
    protonvpn-gui
    spotify
  ];

}
