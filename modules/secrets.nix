# Secrets are managed using sops https://github.com/Mic92/sops-nix
{ inputs, ... }:
{
  flake.modules.homeManager.secrets =
    { config, pkgs, ... }:
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
      dbus.packages = [ pkgs.gcr ];
      services.gnome-keyring.enable = true;
    };

  # flake.modules.nixos.secrets = {
  #   services.gnome.gnome-keyring.enable = true;
  # };
}
