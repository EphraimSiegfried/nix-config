{ pkgs, inputs, ... }:
{
  services.sketchybar = {
    enable = true;
    extraPackages = with pkgs; [
      sketchybar-app-font
      wttrbar
      sbarlua
      lua5_4
      inputs.custom.packages.aarch64-darwin.sketchybar-system-stats
    ];
  };
  launchd.user.agents.sketchybar.serviceConfig = {
    StandardOutPath = "/tmp/sketchybar-logs/sketchybar.stdout.log";
    StandardErrorPath = "/tmp/sketchybar-logs/sketchybar.stderr.log";
  };
  environment.systemPackages = [
    inputs.custom.packages.aarch64-darwin.sketchybar-system-stats
  ];
}
