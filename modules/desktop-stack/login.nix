{
  flake.modules.nixos.login = {
    imports = [ inputs.silentSDDM.nixosModules.default ];
    programs.silentSDDM = {
      enable = true;
      theme = "catppuccin-mocha";

      profileIcons = {
        siegi = ../../icons/magyar-nepmesek.png;
      };
    };

    home-manager.sharedModules = [
      inputs.self.modules.homeManager.wlogout
    ];
  };

  flake.modules.darwin.login = {
    system.defaults.loginwindow = {
      GuestEnabled = false;
      SHOWFULLNAME = false;
    };
  };
}
