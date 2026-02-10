{ inputs, ... }:
{
  flake.modules.nixos.hyprland = {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    home-manager.sharedModules = [
      inputs.self.modules.homeManager.hyprland
    ];
  };

  flake.modules.homeManager.hyprland =
    { pkgs, ... }:
    {

      home.packages = with pkgs; [
        wlogout # gui logout menu
        wl-clipboard
        grim # takes screenshots
        wf-recorder # takes screen recordings
        slurp # can capture selected area
      ];

      wayland.windowManager.hyprland.enable = true;

      home.sessionVariables = {
        MOZ_ENABLE_WAYLAND = 1;
        NIXOS_OZONE_WL = 1;
        QT_QPA_PLATFORM = "wayland";
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
        XCURSOR_SIZE = 128;
      };
    };

  flake.modules.darwin.window_manager = {
    system.defaults = {
      dock.autohide = true;
      WindowManager.StandardHideDesktopIcons = true;
    };
    imports = [
      inputs.self.modules.darwin.aerospace
    ];
  };

  flake.modules.darwin.aerospace =
    { pkgs, ... }:
    let
      sketchybar = pkgs.lib.getExe pkgs.sketchybar;
    in
    {
      services.aerospace = {
        enable = true;
        settings = {
          exec-on-workspace-change = [
            "/bin/bash"
            "-c"
            "${sketchybar} --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE"
          ];
          gaps = {
            outer = {
              left = 10;
              bottom = 10;
              top = 20;
              right = 10;
            };
            inner = {
              horizontal = 10;
              vertical = 10;
            };
          };
        };
      };
    };

  flake.modules.nixos.gnome = {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
}
