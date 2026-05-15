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
  flake.modules.darwin.aerospace =
    { pkgs, ... }:
    let
      sketchybar = pkgs.lib.getExe pkgs.sketchybar;
    in
    {
      services.aerospace = {
        enable = true;
        settings = {
          exec-on-workspace-change = [
            "/bin/bash"
            "-c"
            "${sketchybar} --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE"
          ];
          gaps = {
            outer = {
              left = 10;
              bottom = 10;
              top = 20;
              right = 10;
            };
            inner = {
              horizontal = 10;
              vertical = 10;
            };
          };
        };
      };
    };

  flake.modules.darwin.login = {
    system.defaults.loginwindow = {
      GuestEnabled = false;
      SHOWFULLNAME = false;
    };
  };

  flake.modules.darwin.sketchybar =
    { pkgs, ... }:
    {

      system.defaults.NSGlobalDomain._HIHideMenuBar = true;
      homebrew.brews = [ "ifstat" ];
      homebrew.casks = [ "sf-symbols" ];
      services.sketchybar = {
        enable = true;
        package = inputs.sketchybar-config.packages.${pkgs.system}.default;
      };
      launchd.user.agents.sketchybar.serviceConfig = {
        StandardOutPath = "/tmp/sketchybar-logs/sketchybar.stdout.log";
        StandardErrorPath = "/tmp/sketchybar-logs/sketchybar.stderr.log";
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
