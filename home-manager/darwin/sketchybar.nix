{ pkgs, lib, ... }:
{
  xdg.configFile = {
    "sketchybar" = {
      source = lib.cleanSourceWith {
        src = pkgs.fetchFromGitHub {
          owner = "EphraimSiegfried";
          repo = "sketchybar";
          rev = "9861921";
          sha256 = "sha256-nmLi6HBp1K8d4UQ4QW0sDGxbGB1G0oZYa6BHEE9ZGLc=";
        };
      };
      recursive = true;
    };

    "sketchybar/sbar_init" = {
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
}
