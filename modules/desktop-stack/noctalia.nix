{ inputs, ... }:
{
  flake.modules.homeManager.noctalia =
    { pkgs, lib, ... }:
    {
      imports = [ inputs.noctalia.homeModules.default ];

      xdg.configFile."noctalia/plugins.json".force = true;

      programs.noctalia-shell = {
        enable = true;
        package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;

        plugins = {
          sources = [
            {
              enabled = true;
              name = "Noctalia Plugins";
              url = "https://github.com/noctalia-dev/noctalia-plugins";
            }
          ];
          states = {
            network-manager-vpn = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
          };
          version = 2;
        };

        settings = {
          settingsVersion = 59;
          bar = {
            density = "spacious";
            barType = "floating";
            position = "top";
            showCapsule = true;
            backgroundOpacity = 0;
            capsuleOpacity = 0.7;
            useSeparateOpacity = true;
            fontScale = 1;
            widgetSpacing = 10;
            frameThickness = 15;
            widgets = {
              left = [
                {
                  id = "SessionMenu";
                  iconColor = "error";
                }
                {
                  id = "Workspace";
                  showApplications = true;
                  colorizeIcons = true;
                }
              ];
              center = [
                {
                  id = "MediaMini";
                  showArtistFirst = false;
                  showProgressRing = false;
                  maxWidth = 400;
                }
              ];
              right = [
                {
                  id = "SystemMonitor";
                  showCpuUsage = true;
                  showMemoryUsage = true;
                  showMemoryAsPercent = true;
                  showDiskUsage = true;
                  showDiskUsageAsPercent = true;
                  showCpuTemp = false;
                  useMonospaceFont = true;
                }
                {
                  id = "KeyboardLayout";
                  showIcon = false;
                }
                { id = "Volume"; }
                { id = "Bluetooth"; }
                { id = "Network"; }
                { id = "plugin:network-manager-vpn"; }
                { id = "Clock"; }
                {
                  id = "ControlCenter";
                  useDistroLogo = true;
                }
              ];
            };
          };

          general = {
            avatarImage = ../../icons/magyar-nepmesek.png;
            dimmerOpacity = 0;
            enableBlurBehind = true;
            enableShadows = true;
            enableLockScreenMediaControls = true;
            animationSpeed = 1;
          };

          ui = {
            fontDefault = "Sans Serif";
            panelBackgroundOpacity = 50;
          };

          location = {
            use12hourFormat = false;
            showWeekNumberInCalendar = false;
            autoLocate = true;
          };

          controlCenter = {
            position = "close_to_bar_button";
            shortcuts = {
              left = [
                { id = "NightLight"; }
                { id = "DarkMode"; }
                { id = "WallpaperSelector"; }
              ];
              right = [
                { id = "Notifications"; }
                { id = "KeepAwake"; }
                { id = "AirplaneMode"; }
              ];
            };
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
            density = "compact";
            backgroundOpacity = 0.8;
          };

          wallpaper = {
            enabled = true;
            directory = ../../wallpapers;
          };

          colorSchemes = {
            useWallpaperColors = true;
            syncGsettings = true;
          };

          templates = {
            enableUserTheming = true;
            activeTemplates = [
              {
                id = "ghostty";
                enabled = true;
              }
              {
                id = "gtk3";
                enabled = true;
              }
              {
                id = "gtk4";
                enabled = true;
              }
            ];
          };

          idle = {
            enabled = true;
            screenOffTimeout = 300;
            lockTimeout = 330;
            suspendTimeout = 1800;
          };
        };
      };
    };
}
