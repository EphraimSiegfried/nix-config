{ inputs, self, ... }:
{
  flake.modules.homeManager.noctalia =
    { pkgs, ... }:
    {
      imports = [ inputs.noctalia.homeModules.default ];

      programs.noctalia = {
        enable = true;
        package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;

        settings = {
          bar.default = {
            position = "top";
            capsule = true;
            background_opacity = 0;
            capsule_opacity = 0.7;
            scale = 1.1;
            widget_spacing = 10;
            margin_edge = 10;
            margin_ends = 20;
            thickness = 35;

            start = [
              "session"
              "taskbar"
            ];
            center = [
              "media"
            ];
            end = [
              "clipboard"
              "group:g1"
              "volume"
              "keyboard_layout"
              "bluetooth"
              "network"
              "group:g2"
            ];

            capsule_group = [
              {
                id = "g1";
                members = [ "ram" "cpu" ];
                fill = "surface_variant";
                opacity = 0.7;
                padding = 10.0;
              }
              {
                id = "g2";
                members = [ "clock" "control-center" ];
                fill = "surface_variant";
                opacity = 0.7;
                padding = 6.0;
              }
            ];
          };

          widget.keyboard_layout = {
            type = "keyboard_layout";
            hide_when_single_layout = true;
          };

          widget.cpu = {
            type = "sysmon";
            stat = "cpu_usage";
          };

          widget.ram = {
            type = "sysmon";
            stat = "ram_used";
          };

          widget.taskbar = {
            group_by_workspace = true;
            group_single_icon_per_app = true;
          };

          widget.control-center = {
            glyph = "snowflake";
          };

          shell = {
            avatar_path = "${self}/icons/magyar-nepmesek.png";
            font_family = "Sans Serif";
            settings_show_advanced = true;

            animation.speed = 1.0;

            panel = {
              shadow = true;
              launcher_sort_by_usage = true;
              control_center_placement = "attached";
              open_near_click_control_center = true;
            };
          };

          osd.position = "top_right";

          location.auto_locate = true;

          control_center.shortcuts = [
            { type = "nightlight"; }
            { type = "notification"; }
            { type = "caffeine"; }
          ];

          lockscreen.tint_intensity = 0.1;

          dock.enabled = false;

          notification = {
            enable_daemon = true;
            background_opacity = 0.8;
          };

          wallpaper = {
            enabled = true;
            directory = "${self}/wallpapers";
          };

          theme = {
            source = "wallpaper";
            mode = "dark";

            templates = {
              enable_builtin_templates = true;
              enable_community_templates = true;
              builtin_ids = [
                "ghostty"
                "gtk3"
                "gtk4"
              ];
              community_ids = [
                "pywalfox"
              ];
            };
          };

          idle = {
            behavior = {
              lock = {
                enabled = true;
                timeout = 330;
              };
              screen-off = {
                enabled = true;
                timeout = 300;
              };
              lock-and-suspend = {
                enabled = true;
                timeout = 1800;
              };
            };
          };

          plugins = {
            enabled = [];
            source = [
              {
                name = "official";
                kind = "git";
                enabled = true;
                auto_update = false;
                location = "https://github.com/noctalia-dev/official-plugins";
              }
            ];
          };
        };
      };
    };
}
