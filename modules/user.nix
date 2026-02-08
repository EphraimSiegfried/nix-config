# Sets the default user for each system
# The primaryUser is defined in /modules/meta/user.nix
{ config, ... }:
{
  flake.modules.nixos.user =
    { pkgs, ... }:
    {
      time.timeZone = config.primaryUser.timeZone;
      users.users.${config.primaryUser.username} = {
        isNormalUser = true;
        description = "${config.primaryUser.firstName} ${config.primaryUser.lastName}";
        extraGroups = [
          "networkmanager"
          "wheel"
          "docker"
          "wireguard"
        ];
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = config.primaryUser.publicSSHKeys;
        initialPassword = "changeme";
      };

      programs.zsh.enable = true;
    };

  flake.modules.homeManager.user =
    { pkgs, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      hasSuffix = pkgs.lib.hasSuffix;
      # linux and macos have different home directory names
      homeDir = if hasSuffix "linux" system then "/home" else "/Users";
    in
    {
      home.username = config.primaryUser.username;
      home.homeDirectory = "${homeDir}/${config.primaryUser.username}";
    };

  flake.modules.darwin.user = {
    system.primaryUser = config.primaryUser.username;
  };

}
