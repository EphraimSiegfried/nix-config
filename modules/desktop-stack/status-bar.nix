{ inputs, ... }:
{
  flake.modules.homeManager.hyprland = {
    imports = [
      inputs.self.modules.homeManager.noctalia
    ];
  };

  flake.modules.darwin.status_bar = {
    # hide status bar on macos
    system.defaults.NSGlobalDomain._HIHideMenuBar = true;
    imports = [
      inputs.self.modules.darwin.sketchybar
    ];
  };

}
