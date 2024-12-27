{ pkgs, ... }:
let
  # TODO: call this through pkgs (does not work for some reason)
  sbarlua = pkgs.callPackage ../pkgs/sbarlua { };

in
{
  services.sketchybar = {
    enable = true;
    extraPackages = with pkgs; [
      sketchybar-app-font
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
