{
  flake.modules.nixos.battery-macbook = {
    services.upower.enable = true;
    services.mbpfan.enable = true;

    services.tlp = {
      enable = true;
      settings = {
        # CPU scaling governor adjustments for older Intel chips
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        # Energy Performance Hints (supported by Intel Broadwell)
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        # Aggressive power down for components at idle
        PCIE_ASPM_ON_AC = "performance";
        PCIE_ASPM_ON_BAT = "powersave";

        # Audio power saving (stops the audio chip from draining power)
        SOUND_POWER_SAVE_ON_AC = 0;
        SOUND_POWER_SAVE_ON_BAT = 1;

        # Turn off Bluetooth on boot to save battery (optional)
        DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
      };
    };
  };
}
