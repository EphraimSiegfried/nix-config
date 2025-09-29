{ inputs, config, ... }:
{
  imports = [
    inputs.sops-nix.homeModules.sops
  ];
  home.sessionVariables = {
    SOPS_AGE_KEY_FILE = "${config.home.homeDirectory}/sops/age/keys.txt";
  };

  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/secrets.yaml;
    secrets."weatherapi/api_key" = { };
  };
}
