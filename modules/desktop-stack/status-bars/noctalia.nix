{ inputs, ... }:
{
  flake.modules.homeManager.noctalia =
    { pkgs, config, ... }:
    {
      imports = [ inputs.noctalia.homeModules.default ];

      wayland.windowManager.hyprland.settings = {
        exec-once = [
          "uwsm app -- noctalia-shell"
        ];
      };

      programs.noctalia-shell = {
        enable = true;
        package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;

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
                { id = "SystemMonitor"; }
                { id = "KeyboardLayout"; }
                { id = "Volume"; }
                { id = "Bluetooth"; }
                { id = "Network"; }
                { id = "VPN"; }
                { id = "Clock"; }
                {
                  id = "ControlCenter";
                  useDistroLogo = true;
                }
              ];
            };
          };

          general = {
            avatarImage = "/home/siegi/nix-config/icons/magyar-nepmesek.png";
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
            name = "Basel";
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
              {
                enabled = true;
                id = "profile-card";
              }
              {
                enabled = false;
                id = "brightness-card";
              }
              {
                enabled = true;
                id = "weather-card";
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
            density = "compact";
            backgroundOpacity = 0.8;
          };

          wallpaper = {
            enabled = true;
            directory = "~/nix-config/wallpapers";
            viewMode = "browse";
          };

          colorSchemes = {
            darkMode = true;
            useWallpaperColors = true;
            generationMethod = "content";
            predefinedScheme = "Noctalia (default)";
          };
        };
      };
    };
}
