{ pkgs, ... }:
let
  # TODO: call this through pkgs (does not work for some reason)
  sketchybarhelper = pkgs.callPackage ../pkgs/sketchyhelper { };

in
{
  services.sketchybar = {
    enable = true;
    extraPackages = with pkgs; [
      sketchybar-app-font
      sketchybarhelper
      wttrbar
      sbarlua
      lua5_4
    ];
  };
  # launchd.user.agents.sketchybar.serviceConfig = {
  #   StandardOutPath = "/tmp/sketchybar-logs/sketchybar.stdout.log";
  #   StandardErrorPath = "/tmp/sketchybar-logs/sketchybar.stderr.log";
  # };
}
