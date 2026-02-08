# Secrets are managed using sops https://github.com/Mic92/sops-nix
{ inputs, ... }:
{
  flake.modules.homeManager.secrets =
    { config, ... }:
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
    };
}
