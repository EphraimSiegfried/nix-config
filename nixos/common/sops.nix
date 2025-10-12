{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    # TODO: generalize
    age.keyFile = "/home/siegi/.config/sops/age/keys.txt";
    secrets."vpn/wg_conf.conf" = { };
  };
}
