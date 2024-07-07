{
  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "where_is_my_sddm_theme";
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
