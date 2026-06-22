{
  flake.modules.homeManager.ghostty =
    { config, lib, pkgs, ... }:
    {
      programs.ghostty = {
        enable = pkgs.stdenv.isLinux;
        settings = {
          theme = lib.mkIf config.programs.noctalia.enable "noctalia";
          background-opacity = 0.8;
          font-size = 15;
        };
      };
    };
}
