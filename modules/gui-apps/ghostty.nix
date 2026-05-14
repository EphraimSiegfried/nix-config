{
  flake.modules.homeManager.ghostty =
    { config, lib, ... }:
    {
      programs.noctalia-shell.settings.templates.activeTemplates =
        lib.mkIf config.programs.noctalia-shell.enable [
          {
            id = "ghostty";
            active = true;
          }
        ];

      programs.ghostty = {
        enable = true;
        settings = {
          theme = lib.mkIf config.programs.noctalia-shell.enable "noctalia";
          background-opacity = 0.8;
        };
      };
    };
}
