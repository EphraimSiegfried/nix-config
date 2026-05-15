{ inputs, config, ... }:
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

  flake.modules.darwin.system_defaults = {
    system = {
      defaults = {
        NSGlobalDomain = {
          "com.apple.sound.beep.feedback" = 0;
          "com.apple.sound.beep.volume" = 0.0;
        };

        screencapture.location = "Users/${config.primaryUser.username}/Pictures/screenshots";
      };

      activationScripts.activateSettings.text = ''
        /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
      '';
    };
    security.pam.services.sudo_local.touchIdAuth = true;
  };
}
