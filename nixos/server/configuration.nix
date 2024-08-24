{ modulesPath, inputs, outputs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ../common/configuration.nix
    # ./hardware-configuration.nix
    ./disk-config.nix
    ./variables.nix
  ];

  networking = {
    hostName = "zeus";
  };
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  users.users.root.openssh.authorizedKeys.keys = [
    # change this to your ssh key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1R2gEuXslK413gWBE4tOA894zO/MkhZrAK/LyRcsmo"
  ];
}
