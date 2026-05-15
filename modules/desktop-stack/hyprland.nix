{ inputs, ... }:
{
  flake.modules.nixos.hyprland =
    { pkgs, ... }:
    {
    services.xserver.enable = true;
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    home-manager.sharedModules = [
      inputs.self.modules.homeManager.hyprland
    ];
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
    imports = [
      inputs.self.modules.nixos.desktop_services
      inputs.self.modules.nixos.login
    ];
  };

  flake.modules.homeManager.hyprland =
    { pkgs, ... }:
    {
      imports = [
        inputs.self.modules.homeManager.noctalia
        inputs.self.modules.homeManager.hyprland_keybindings
        inputs.self.modules.homeManager.desktop_services
      ];

      home.packages = with pkgs; [
        wl-clipboard
        grim
        wf-recorder
        slurp
      ];

      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          xwayland.force_zero_scaling = true;

          exec-once = [
            "uwsm app -- noctalia-shell"
          ];

          general = {
            gaps_in = 5;
            gaps_out = 10;
          };

          decoration = {
            rounding = 20;
            rounding_power = 2;
            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              color = "rgba(1a1a1aee)";
            };
            blur = {
              enabled = true;
              size = 3;
              passes = 2;
              vibrancy = 0.1696;
            };
          };

          input = {
            kb_layout = "us,ch";
            kb_variant = ",de";
            kb_options = "grp:win_space_toggle";
            touchpad = {
              natural_scroll = true;
              scroll_factor = 0.3;
            };
          };

          gesture = [
            "3, horizontal, workspace"
          ];

          layerrule = [
            "blur, noctalia-background-.*"
            "ignorealpha 0.5, noctalia-background-.*"
            "blur, noctalia-bar-content-.*"
            "ignorealpha 0.5, noctalia-bar-content-.*"
          ];
        };
      };


      home.sessionVariables = {
        MOZ_ENABLE_WAYLAND = 1;
        NIXOS_OZONE_WL = 1;
        QT_QPA_PLATFORM = "wayland";
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
        XCURSOR_SIZE = 128;
        ADW_DISABLE_PORTAL = 1;
      };
    };
}
