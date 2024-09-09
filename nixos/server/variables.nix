{ lib, ... }:
{
  options = with lib; with types; {
    domain = mkOption { type = str; };
    dataDir = mkOption { type = str; };
    email = mkOption { type = str; };
  };
  config = {
    domain = "qew.ch";
    dataDir = "/opt/data";
    email = "ephraim.siegfried@hotmail.com";
  };
}
