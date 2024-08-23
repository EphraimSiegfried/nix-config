{ inputs, outputs, ... }: {
  imports = [
    ../common/configuration.nix
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "zeus";
  };
}
