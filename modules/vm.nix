# Creates a virtual machine for my main linux host configuration
# This makes testing easier as I don't need to reboot and apply changes immediately

# The password for the user inside the vm is changeme
# keybindings can be activated by pressing: Ctrl+Alt+G

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
