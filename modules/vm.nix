{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.vm = pkgs.writeShellApplication {
        name = "vm";
        text = ''
          ${inputs.self.nixosConfigurations.blinkybill.config.system.build.vm}/bin/run-blinkybill-vm "$@"
        '';
      };
    };
}
