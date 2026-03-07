{
  flake.modules.homeManager.hyprland =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.brightnessctl
      ];
      programs.hyprlock.enable = true;

      services.hypridle = {
        enable = true;
        settings = {
          general = {
            before_sleep_cmd = "loginctl lock-session";
            after_sleep_cmd = "hyprctl dispatch dpms on";
            lock_cmd = "pidof hyprlock | hyprlock";
          };

          listener = [
            {
              timeout = 60; # 1 min
              on-timeout = "brightnessctl --save && brightnessctl set 10%"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
              on-resume = "brightnessctl --restore"; # monitor backlight restore.
            }
            {
              timeout = 300; # 3 min
              on-timeout = "loginctl lock-session";
            }
            {
              timeout = 330; # 5.5min
              on-timeout = "hyprctl dispatch dpms off";
              on-resume = "hyprctl dispatch dpms on && brightnessctl --restore";
            }
            {
              timeout = 1800; # 30min
              on-timeout = "systemctl suspend";
            }
          ];
        };
      };

    };
}
