{ pkgs, ... }: {
  imports = [
    ./skhd.nix
    ./brew.nix
    ./yabai.nix
    ./sketchybar.nix
    ./jankyborders.nix
  ];

  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [ "nix-command" "flakes" ];
    };
  };
  nixpkgs = {
    hostPlatform = "x86_64-darwin";
    config.allowUnfree = true;
  };

  environment.systemPackages = [
    pkgs.home-manager
  ];
  programs.zsh.enable = true;
  services.nix-daemon.enable = true;

  environment.darwinConfig = "$HOME/nix-config/flake.nix";

  system = {
    stateVersion = 4;
    defaults = {

      dock = {
        autohide = true;
        # mru-spaces = false;
      };

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        _FXShowPosixPathInTitle = true;

      };

      loginwindow = {
        GuestEnabled = false;
        SHOWFULLNAME = false;
      };

      NSGlobalDomain = {
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.sound.beep.volume" = 0.0;
        AppleShowAllExtensions = true;
        _HIHideMenuBar = true;
      };

      WindowManager.StandardHideDesktopIcons = true;
      # TODO: Use a variable for home location (doesn't work with $HOME)
      screencapture.location = "Users/siegi/Pictures/screenshots";
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };

    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
  };
  security.pam.enableSudoTouchIdAuth = true;

}
