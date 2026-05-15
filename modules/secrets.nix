{ inputs, ... }:
{
  flake.modules.homeManager.secrets =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      imports = [
        inputs.sops-nix.homeModules.sops
      ];

      home.sessionVariables = {
        SOPS_AGE_KEY_FILE = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
      };

      sops = {
        age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
        defaultSopsFile = "${inputs.self}/secrets/secrets.yaml";
      };

      services.gnome-keyring.enable = lib.mkIf pkgs.stdenv.isLinux true;

      dbus.packages = lib.mkIf pkgs.stdenv.isLinux [ pkgs.gcr ];
    };

  flake.modules.nixos.secrets = {
    services.gnome.gnome-keyring.enable = true;
  };
}
