{ pkgs, ... }:
{
  services.walker = {
    enable = true;
    package = pkgs.walker;
  };
}
