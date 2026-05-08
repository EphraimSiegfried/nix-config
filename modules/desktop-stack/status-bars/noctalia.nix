{ inputs, ... }:
{
  flake.modules.homeManager.noctalia =
    { pkgs, ... }:
    {
      imports = [ inputs.noctalia.homeModules.default ];

      wayland.windowManager.hyprland.settings = {
        exec-once = [
          "uwsm app -- noctalia-shell"
        ];
        layerrule = [
          "blur, noctalia-background-.*"
          "ignorealpha 0.5, noctalia-background-.*"
          "blur, noctalia-bar-content-.*"
          "ignorealpha 0.5, noctalia-bar-content-.*"
        ];
      };

      programs.noctalia-shell = {
        enable = true;
        package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;

        settings = {
          bar = {
            barType = "islands";
            position = "top";
            showCapsule = true;
            backgroundOpacity = 0.8;
            fontScale = 1.3;
            widgets = {
              left = [
                { id = "Launcher"; }
                {
                  id = "Workspace";
                  showApplications = true;
                }
              ];
              center = [ ];
              right = [
                { id = "SystemMonitor"; }
                { id = "KeyboardLayout"; }
                { id = "Volume"; }
                { id = "Bluetooth"; }
                { id = "Network"; }
                { id = "Clock"; }
                { id = "ControlCenter"; }
              ];
            };
          };

          general = {
            enableBlurBehind = true;
            enableShadows = true;
            animationSpeed = 1;
          };

          ui = {
            panelBackgroundOpacity = 0.9;
          };

          location = {
            use12hourFormat = false;
            showWeekNumberInCalendar = false;
          };

          systemMonitor = {
            cpuWarningThreshold = 70;
            cpuCriticalThreshold = 90;
            tempWarningThreshold = 60;
            tempCriticalThreshold = 90;
            memWarningThreshold = 70;
            memCriticalThreshold = 85;
            diskWarningThreshold = 80;
            diskCriticalThreshold = 90;
          };

          controlCenter = {
            position = "close_to_bar_button";
            shortcuts = {
              left = [
                { id = "Network"; }
                { id = "Bluetooth"; }
                { id = "WallpaperSelector"; }
              ];
              right = [
                { id = "Notifications"; }
                { id = "NightLight"; }
                { id = "KeepAwake"; }
              ];
            };
            cards = [
              {
                enabled = true;
                id = "shortcuts-card";
              }
              {
                enabled = true;
                id = "audio-card";
              }
              {
                enabled = true;
                id = "media-sysmon-card";
              }
            ];
          };

          appLauncher = {
            terminalCommand = "kitty -e";
            sortByMostUsed = true;
          };

          dock = {
            enabled = false;
          };

          notifications = {
            enabled = true;
            location = "top_right";
          };

          wallpaper = {
            enabled = true;
            directory = "~/nix-config/wallpapers";
          };

          colorSchemes = {
            darkMode = true;
            useWallpaperColors = true;
            predefinedScheme = "Noctalia (default)";
          };
        };
      };
    };
}
