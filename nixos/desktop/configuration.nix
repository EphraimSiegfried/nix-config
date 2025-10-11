{
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    ../common/configuration.nix
    ./modules/sshd.nix
    ./modules/network.nix
    ./modules/packages.nix
    ./modules/kanata.nix
    ./modules/amdgpu.nix
    ./modules/hyprland.nix
    ./modules/gaming.nix
    ./modules/bluetooth.nix
    ./modules/wireshark.nix
    ./modules/hyprland.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    videoDrivers = [ "amdgpu" ];
  };
  services.displayManager.ly.enable = true;
  hardware.graphics.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
}
