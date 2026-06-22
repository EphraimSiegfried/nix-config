{ inputs, ... }:
{
  flake.modules.homeManager.noctalia_laptop =
    { lib, ... }:
    {
      imports = [ inputs.self.modules.homeManager.noctalia ];

      programs.noctalia.settings.bar.default = {
        end = lib.mkForce [
          "cpu"
          "ram"
          "keyboard_layout"
          "battery"
          "volume"
          "bluetooth"
          "network"
          "clock"
          "control-center"
        ];
      };
    };
}
