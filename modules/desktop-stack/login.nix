{
  flake.modules.nixos.login = {
    services.displayManager.sddm.enable = true;
  };

  flake.modules.darwin.login = {
    system.defaults.loginwindow = {
      GuestEnabled = false;
      SHOWFULLNAME = false;
    };
  };
}
