{
  pkgs,
  lib,
  config,
  ...
}: {
  users.users.siegi = {
    isNormalUser = true;
    description = "Ephraim Siegfried";
    extraGroups = ["networkmanager" "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqWs4UGEkx+HwmzymPMSyBshtygcza0ov9u8uuLGPbH ephraimsiegfried@maces.home"
    ];
  };

}
