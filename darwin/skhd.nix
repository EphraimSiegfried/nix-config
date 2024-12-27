{ lib, pkgs, ... }:
let
  inherit (lib) getExe;
  launcher = "shift + cmd";
  terminal = getExe pkgs.kitty;
in
{
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig =
      ''
        ${launcher} - k : ${terminal} --single-instance -d ~
        ${launcher} - b : /Applications/Firefox.app
        ${launcher} - s : /Applications/Spotify.app
        ${launcher} - b : /Applications/Firefox.app
      '';
  };
}
