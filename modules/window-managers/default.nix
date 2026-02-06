# This file assigns window managers to operating systems

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
}
