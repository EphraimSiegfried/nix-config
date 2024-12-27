{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    sbarlua
  ];
  xdg.configFile = {
    "sketchybar" = {
      source = lib.cleanSourceWith {
        src = pkgs.fetchFromGitHub {
          owner = "EphraimSiegfried";
          repo = "sketchybar";
          rev = "90e8a76";
          sha256 = "sha256-d8fHkesOSaiXikaOrNX8izfSV+kwlwK0JLOYaARS7X4=";
        };
      };
      recursive = true;
    };

    "sketchybar/sketchybarrc" = {
      executable = true;
      text = # Lua
        ''
          #!/usr/bin/env lua

          -- Add the sketchybar module to the package cpath (the module could be
          -- installed into the default search path then this would not be needed)
          package.cpath = package.cpath .. ";${pkgs.sbarlua}/lib/lua/${pkgs.lua.luaversion}/?.so"

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
}
