{ inputs, ... }:
{
  flake.modules.darwin.sketchybar =
    { pkgs, ... }:
    {
      homebrew.brews = [ "ifstat" ];
      homebrew.casks = [ "sf-symbols" ];
      services.sketchybar = {
        enable = true;
        package = inputs.sketchybar-config.packages.${pkgs.system}.default;
      };
      launchd.user.agents.sketchybar.serviceConfig = {
        StandardOutPath = "/tmp/sketchybar-logs/sketchybar.stdout.log";
        StandardErrorPath = "/tmp/sketchybar-logs/sketchybar.stderr.log";
      };
    };
}
