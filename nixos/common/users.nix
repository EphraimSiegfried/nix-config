{ pkgs, ... }:
{
  nix.settings.trusted-users = [
    "root"
    "siegi"
  ];
  users.users.siegi = {
    isNormalUser = true;
    description = "Ephraim Siegfried";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "wireguard"
    ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqWs4UGEkx+HwmzymPMSyBshtygcza0ov9u8uuLGPbH"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1R2gEuXslK413gWBE4tOA894zO/MkhZrAK/LyRcsmo"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGdANrCkeXTrZha/w3pvg/vCZWmuRsy7cI6PmgVfWH8c siegi@blinkybill"
    ];
  };
}
