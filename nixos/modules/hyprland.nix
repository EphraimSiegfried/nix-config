{ pkgs, ... }:
let
  tokyo-night-sddm = pkgs.libsForQt5.callPackage ./tokyo-night-sddm.nix { };
in
{
  environment.systemPackages = with pkgs; [ tokyo-night-sddm ];
  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "tokyo-night-sddm";
    };
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
