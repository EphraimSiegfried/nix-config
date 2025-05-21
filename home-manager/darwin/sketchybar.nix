{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    sbarlua
    wttrbar
    sketchyhelper
  ];
  xdg.configFile = {
    "sketchybar" = {
      source = lib.cleanSourceWith {
        src = pkgs.fetchFromGitHub {
          owner = "EphraimSiegfried";
          repo = "sketchybar";
          rev = "750ea07";
          sha256 = "sha256-fwilWnRASrjrq/xLMj2jQUDzifLKdn3MaWsWgfdMvrY=";
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
