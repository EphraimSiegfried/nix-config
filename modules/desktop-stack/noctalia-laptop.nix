{ inputs, ... }:
{
  flake.modules.homeManager.noctalia_laptop =
    { lib, ... }:
    {
      imports = [ inputs.self.modules.homeManager.noctalia ];

      programs.noctalia.settings.widget.battery = {
        type = "battery";
      };

      programs.noctalia.settings.bar.default = {
        center = lib.mkForce [ ];

        end = lib.mkForce [
          "group:g1"
          "keyboard_layout"
          "volume"
          "bluetooth"
          "network"
          "group:g2"
        ];

        capsule_group = lib.mkForce [
          {
            id = "g1";
            members = [
              "ram"
              "cpu"
              "battery"
            ];
            fill = "surface_variant";
            opacity = 0.7;
            padding = 10.0;
          }
          {
            id = "g2";
            members = [
              "clock"
              "control-center"
            ];
            fill = "surface_variant";
            opacity = 0.7;
            padding = 6.0;
          }
        ];
      };
    };
}
