{
  flake.modules.homeManager.waybar =
    { pkgs, ... }:
    {
      fonts.fontconfig.enable = true;
      home.packages = [
        pkgs.nerd-fonts.monaspace
        pkgs.nerd-fonts.fira-code
        pkgs.fira-code
        pkgs.fira-code-symbols

      ];
      programs.waybar = {
        enable = true;
        systemd.enable = true;
        style = ./style.css;
        settings = {
          mainBar = {
            spacing = 10;
            margin = "10";
            height = 20;

            modules-left = [
              "custom/menu"
              "hyprland/workspaces"
            ];
            modules-right = [
              "group/utils"
              "group/stats"
              "clock"
            ];

            "group/stats" = {
              orientation = "horizontal";
              modules = [
                "disk"
                "memory"
                "cpu"
                "temperature"
              ];
            };

            "group/utils" = {
              orientation = "horizontal";
              modules = [
                "pulseaudio"
                "bluetooth"
                "network"
                "hyprland/language"
              ];
            };

            "hyprland/language" = {
              format = "{}";
              format-en = "EN";
              format-de = "DE";
              on-click = "hyprctl switchxkblayout all next";
            };

            disk = {
              format = "  {percentage_used}%";
            };

            clock = {
              format = "{:%a %d. %b %H:%M}";
              tooltip = true;
              tooltip-format = "<big>{:%B %Y}</big>\n<tt>{calendar}</tt>";
            };

            temperature = {
              critical-threshold = 90;
              interval = 5;
              format = "{icon} {temperatureC}°";
              format-icons = [
                ""
                ""
                ""
              ];
              tooltip = false;
            };

            cpu = {
              interval = 5;
              format = "󰘚 {usage}%";
              states = {
                warning = 70;
                critical = 90;
              };
              on-click = "hyprctl dispatch exec [floating] kitty 'sh -c nix-shell htop'";
            };

            memory = {
              format = "󰍛 {}%";
            };

            bluetooth = {
              format = "";
              format-disabled = "󰂲";
              format-connected = "󰂱";
              tooltip-format = "{controller_alias}\t{controller_address}";
              tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
              tooltip-format-disabled = "";
              tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
              on-click = "blueman-manager";
            };

            network = {
              interval = 5;
              format-wifi = " ";
              format-ethernet = "󰈀";
              format-disconnected = "󰖪";
              tooltip-format = "{ifname} ({essid}): {ipaddr}";
              on-click = "kitty -- nmtui";
            };

            pulseaudio = {
              scroll-step = 5;
              format = "{icon} {volume}%{format_source}";
              format-muted = "󰖁 {format_source}";
              format-source = "";
              format-source-muted = " 󰍭";
              format-icons = {
                headphone = "󰋋";
                headset = "󰋎";
                default = [
                  "󰕿"
                  "󰖀"
                  "󰕾"
                ];
              };
              on-click = "pavucontrol";
            };

            "custom/menu" = {
              format = "";
              on-click = "wlogout";
              tooltip = false;
            };

            #https://github.com/khaneliman/khanelinix/blob/6a632fd0e85d1292e352683de9c4736f81b6c86d/modules/home/programs/graphical/bars/waybar/modules/hyprland-modules.nix
            "hyprland/workspaces" = {
              all-outputs = false;
              active-only = "false";
              format = "<span font='14'>{icon}</span> {windows}";
              format-icons = {
                "1" = "󰎤";
                "2" = "󰎧";
                "3" = "󰎪";
                "4" = "󰎭";
                "5" = "󰎱";
                "6" = "󰎳";
                "7" = "󰎶";
                "8" = "󰎹";
                "9" = "󰎼";
                "10" = "󰽽";
                "urgent" = "󱨇";
                "default" = "";
                "empty" = "󱓼";
              };
              # "format-window-separator" = "->";
              window-rewrite-default = "";
              window-rewrite = {
                "class<.devede_ng.py-wrapped>" = "";
                "class<.pitivi-wrapped>" = "󱄢";
                "class<.xemu-wrapped>" = "";
                "class<1Password>" = "󰢁";
                "class<Alacritty>" = "";
                "class<Ardour-.*>" = "";
                "class<Bitwarden>" = "󰞀";
                "class<Caprine>" = "󰈎";
                "class<DBeaver>" = "";
                "class<Darktable>" = "󰄄";
                "class<Github Desktop>" = "󰊤";
                "class<Godot>" = "";
                "class<Mysql-workbench-bin>" = "";
                "class<Nestopia>" = "";
                "class<Postman>" = "󰛮";
                "class<Ryujinx>" = "󰟡";
                "class<Slack>" = "󰒱";
                "class<Spotify>" = "";
                "class<Youtube Music>" = "";
                "class<bleachbit>" = "";
                "class<code>" = "󰨞";
                "class<com.obsproject.Studio" = "󱜠";
                "class<com.usebottles.bottles>" = "󰡔";
                "class<discord>" = "󰙯";
                "class<dropbox>" = "";
                "class<dupeGuru>" = "";
                "class<firefox.*> title<.*github.*>" = "";
                "class<firefox.*> title<.*twitch|youtube|plex|tntdrama|bally sports.*>" = "";
                "class<firefox.*>" = "";
                "class<brave.*>" = "󰖟";
                "class<foot>" = "";
                "class<fr.handbrake.ghb" = "󱁆";
                "class<heroic>" = "󱢾";
                "class<info.cemu.Cemu>" = "󰜭";
                "class<io.github.celluloid_player.Celluloid>" = "";
                "class<kitty>" = "";
                "class<libreoffice-calc>" = "󱎏";
                "class<libreoffice-draw>" = "󰽉";
                "class<libreoffice-impress>" = "󱎐";
                "class<libreoffice-writer>" = "";
                "class<mGBA>" = "󱎓";
                "class<mediainfo-gui>" = "󱂷";
                "class<melonDS>" = "󱁇";
                "class<minecraft-launcher>" = "󰍳";
                "class<mpv>" = "";
                "class<org.gnome.Nautilus>" = "󰉋";
                "class<org.kde.digikam>" = "󰄄";
                "class<org.kde.filelight>" = "";
                "class<org.prismlauncher.PrismLauncher>" = "󰍳";
                "class<org.qt-project.qtcreator>" = "";
                "class<org.shotcut.Shotcut>" = "󰈰";
                "class<org.telegram.desktop>" = "";
                "class<org.wezfurlong.wezterm>" = "";
                "class<pcsx2-qt>" = "";
                "class<pcsxr>" = "";
                "class<shotwell>" = "";
                "class<steam>" = "";
                "class<tageditor>" = "󱩺";
                "class<teams-for-linux>" = "󰊻";
                "class<thunar>" = "󰉋";
                "class<thunderbird>" = "";
                "class<unityhub>" = "󰚯";
                "class<virt-manager>" = "󰢹";
                "class<vlc>" = "󰕼";
                "class<wlroots> title<.*WL-1.*>" = "";
                "class<xwaylandvideobridge>" = "";
                "code-url-handler" = "󰨞";
                "title<RPCS3.*>" = "";
                "title<Spotify Free>" = "";
                "title<Steam>" = "";
              };
            };

          };
        };
      };
    };
}
