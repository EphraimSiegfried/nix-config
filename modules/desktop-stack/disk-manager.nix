{

  flake.modules.homeManager.hyprland = {
    services.udiskie = {
      enable = true;
      notify = true;
    };
  };
  flake.modules.nixos.hyprland = {
    services.udisks2.enable = true;
  };
}
