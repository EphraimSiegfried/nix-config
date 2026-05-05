{ inputs, ... }:
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

  flake.modules.homeManager.wlogout = {
    programs.wlogout = {
      enable = true;
      layout = [
        { label = "lock"; action = "loginctl lock-session"; text = "Lock"; keybind = "l"; }
        { label = "logout"; action = "uwsm stop"; text = "Logout"; keybind = "e"; }
        { label = "suspend"; action = "systemctl suspend"; text = "Suspend"; keybind = "u"; }
        { label = "reboot"; action = "systemctl reboot"; text = "Reboot"; keybind = "r"; }
        { label = "shutdown"; action = "systemctl poweroff"; text = "Shutdown"; keybind = "s"; }
        { label = "hibernate"; action = "systemctl hibernate"; text = "Hibernate"; keybind = "h"; }
      ];
    };
  };

  flake.modules.darwin.login = {
    system.defaults.loginwindow = {
      GuestEnabled = false;
      SHOWFULLNAME = false;
    };
  };
}
