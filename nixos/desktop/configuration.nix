{
  imports = [
    ../common/configuration.nix
    ./modules/sshd.nix
    ./modules/network.nix
    ./modules/packages.nix
    ./modules/keyboard.nix
    ./modules/amdgpu.nix
    ./modules/hyprland.nix
    ./modules/gaming.nix
    ./modules/bluetooth.nix
    ./modules/wireshark.nix
    ./modules/hyprland.nix
    ./modules/audio.nix
    ./modules/docker.nix
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };
  hardware.graphics.enable = true;
  services.displayManager.sddm.enable = true;

  services.printing.enable = true;

  fonts.enableDefaultPackages = true;

}
