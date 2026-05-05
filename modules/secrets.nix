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

      # Use mkIf inside the attribute set instead of lib.optionals outside of it
      services.gnome-keyring.enable = lib.mkIf pkgs.stdenv.isLinux true;

      # For attributes that take lists, you can wrap the list or the whole attribute
      dbus.packages = lib.mkIf pkgs.stdenv.isLinux [ pkgs.gcr ];
    };

  flake.modules.nixos.secrets = {
    services.gnome.gnome-keyring.enable = true;
  };
}
