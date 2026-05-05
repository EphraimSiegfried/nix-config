{
  flake.modules.homeManager.ashell = {
    programs.ashell = {
      enable = true;
      systemd.enable = true;
      settings = {
        position = "Top";

        modules = {
          left = [ "Workspaces" ];
          center = [ ];
          right = [ "SystemInfo" "KeyboardLayout" [ "Tray" "Tempo" "Settings" ] ];
        };

        workspaces = {
          visibilityMode = "All";
          groupByMonitor = false;
          enableWorkspaceFilling = true;
          workspaceNames = [ "󰎤" "󰎧" "󰎪" "󰎭" "󰎱" "󰎳" "󰎶" "󰎹" "󰎼" "󰽽" ];
        };

        systemInfo = {
          indicators = [ "Disk" "Memory" "Cpu" "Temperature" ];
          format = "IconAndValue";
          interval = 5;
          cpu = {
            warnThreshold = 70;
            alertThreshold = 90;
          };
          memory = {
            warnThreshold = 70;
            alertThreshold = 85;
          };
          temperature = {
            warnThreshold = 60;
            alertThreshold = 90;
          };
        };

        tempo = {
          clockFormat = "%a %d. %b %H:%M";
        };

        settings = {
          lockCmd = "loginctl lock-session";
          audioSinksMoreCmd = "pavucontrol -t 3";
          audioSourcesMoreCmd = "pavucontrol -t 4";
          wifiMoreCmd = "kitty -- nmtui";
          bluetoothMoreCmd = "blueman-manager";
          audioIndicatorFormat = "Icon";
          microphoneIndicatorFormat = "Icon";
          networkIndicatorFormat = "Icon";
          bluetoothIndicatorFormat = "Icon";
          indicators = [ "Audio" "Microphone" "Bluetooth" "Network" "Vpn" ];
        };

        appearance = {
          style = "Islands";
          scaleFactor = 1.5;
          fontName = "Fira Code";
          primaryColor = "#8aadf4";
          successColor = "#a6da95";
          textColor = "#cad3f5";
          dangerColor = {
            base = "#ed8796";
            weak = "#eed49f";
          };
          backgroundColor = {
            base = "#181926";
            weak = "#3c3e4f";
            strong = "#494d64";
          };
          secondaryColor = {
            base = "#24273a";
          };
        };
      };
    };
  };
}
