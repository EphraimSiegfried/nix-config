{ inputs, ... }:
{
  flake.modules.darwin.sketchybar =
    { pkgs, ... }:
    {

      homebrew.brews = [ "ifstat" ];
      homebrew.casks = [ "sf-symbols" ];
      # home-manager.sharedModules = [
      #   inputs.flake.modules.homeManager.sketchybar
      # ];
      services.sketchybar = {
        enable = true;
        extraPackages = with pkgs; [
          sketchybar-app-font
          wttrbar
          sbarlua
          lua5_4
        ];
      };
      launchd.user.agents.sketchybar.serviceConfig = {
        StandardOutPath = "/tmp/sketchybar-logs/sketchybar.stdout.log";
        StandardErrorPath = "/tmp/sketchybar-logs/sketchybar.stderr.log";
      };
    };

  flake.modules.homeManager.sketchybar =
    {
      pkgs,
      lib,
      ...
    }:
    {
      sops.secrets."weatherapi/api_key" = { };
      xdg.configFile = {
        "sketchybar" = {
          source = lib.cleanSourceWith {
            src = pkgs.fetchFromGitHub {
              owner = "EphraimSiegfried";
              repo = "sketchybar";
              rev = "6a93f67";
              sha256 = "sha256-zwiwIx/1DsED9/4tBxgp06B6VTEt5I63br/HUGsRUIw=";
            };
          };
          recursive = true;
        };

        "sketchybar/sketchybarrc" = {
          executable = true;
          text = # Lua
            ''
              #!/usr/bin/bash

              -- Add the sketchybar module to the package cpath (the module could be
              -- installed into the default search path then this would not be needed)
              package.cpath = package.cpath .. ";${pkgs.sbarlua}/lib/lua/${pkgs.lua54Packages.lua.luaversion}/?.so"

              sbar = require("sketchybar")
              sbar.exec("killall sketchyhelper || sketchyhelper git.felix.sketchyhelper >/dev/null 2>&1 &")
              sbar.begin_config()
              require("init")
              sbar.hotload(true)
              sbar.end_config()
              sbar.event_loop()
            '';
        };

      };
    };
}
