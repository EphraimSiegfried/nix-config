{ pkgs, ... }:
{
  home.pointerCursor = {
    enable = true;
    hyprcursor = {
      enable = true;
      size = 60;
    };
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
  };
}
