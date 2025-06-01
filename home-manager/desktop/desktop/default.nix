{ pkgs, ... }: {
  home.packages = with pkgs; [
    wlogout # gui logout menu
    wl-clipboard

    grim #takes screenshots
    wf-recorder #takes screen recordings
    slurp #can capture selected area

    pavucontrol
  ];
  imports = [
    ./hyprland.nix
    ./swaync.nix
    ./waybar
    ./hypridle.nix
    ./wofi.nix
    ./hyprpaper.nix
    ./anyrun
  ];
}
