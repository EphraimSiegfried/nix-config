{ modulesPath, inputs, outputs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ../common/configuration.nix
    # ./hardware-configuration.nix
    ./disk-config.nix
    ./variables.nix
    ./services
    ./nginx.nix
    ./wireguard.nix
    ./ssh.nix
  ];

  #prevent server from suspending when laptop lid is closed
  services.logind.lidSwitchExternalPower = "ignore";

  users.users.siegi = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGdANrCkeXTrZha/w3pvg/vCZWmuRsy7cI6PmgVfWH8c" #desktop
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1R2gEuXslK413gWBE4tOA894zO/MkhZrAK/LyRcsmo" #macbook
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICl+v4ykpRc23POLsmG878jsaE6lmNt8lw+enCeiPjJ1" #rahel
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILZPZrDYjyjdmxzYEDsRYkTDvqx3+pA5z4pQJsuufXRk" #phone
    ];
  };

  networking = {
    hostName = "zeus";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 81 443 ];
    };
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
