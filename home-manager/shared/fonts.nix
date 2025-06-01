{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs.nerd-fonts; [
    fira-code
    droid-sans-mono
    hack
    meslo-lg
    monaspace
  ];
}
