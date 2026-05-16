{ inputs, ... }:
{
  flake.modules.homeManager.noctalia_laptop =
    { lib, ... }:
    {
      imports = [ inputs.self.modules.homeManager.noctalia ];

      programs.noctalia-shell.settings.bar = {
        barType = lib.mkForce "standard";
        widgets.right = lib.mkForce [
          {
            id = "SystemMonitor";
            compactMode = false;
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
          { id = "Battery"; }
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
}
