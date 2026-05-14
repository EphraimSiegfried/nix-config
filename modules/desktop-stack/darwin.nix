{ inputs, ... }:
{
  flake.modules.darwin.window_manager = {
    system.defaults = {
      dock.autohide = true;
      WindowManager.StandardHideDesktopIcons = true;
    };
    imports = [
      inputs.self.modules.darwin.aerospace
    ];
  };

  flake.modules.darwin.status_bar = {
    system.defaults.NSGlobalDomain._HIHideMenuBar = true;
    imports = [
      inputs.self.modules.darwin.sketchybar
    ];
  };

  flake.modules.darwin.login = {
    system.defaults.loginwindow = {
      GuestEnabled = false;
      SHOWFULLNAME = false;
    };
  };
}
