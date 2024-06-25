{ pkgs, config, lib, ... }: {
  networking.networkmanager.enable = true;
  networking.hostName = "blinkybill";
}
