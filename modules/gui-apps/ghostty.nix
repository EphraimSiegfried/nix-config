{
  flake.modules.homeManager.ghostty =
    { config, lib, ... }:
    {
      programs.ghostty = {
        enable = true;
        settings = {
          theme = lib.mkIf config.programs.noctalia-shell.enable "noctalia";
          background-opacity = 0.8;
          font-size = 15;
        };
      };
    };
}
