# This file assigns bars to operating systems

{ inputs, ... }:
{
  flake.modules.darwin.status_bar = {
    # hide status bar on macos
    system.defaults.NSGlobalDomain._HIHideMenuBar = true;
    imports = [
      inputs.self.modules.darwin.sketchybar
    ];
  };

  flake.modules.homeManager.status_bar = {
    imports = [
      inputs.self.modules.homeManager.sketchybar
    ];
  };
}
