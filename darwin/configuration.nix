{ pkgs, ... }:
{
  imports = [
    ./brew.nix
    ./sketchybar.nix
    ./jankyborders.nix
    ./launchd.nix
    ./aerospace.nix
    ./linux-builder.nix
  ];

  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [
        "nix-command"
        "flakes"
        "ca-derivations"
        "git-hashing"
      ];
      trusted-users = [
        "root"
        "siegi"
      ];
    };
    # works only if when running `softwareupdate --install-rosetta --agree-to-license`
    extraOptions = ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  environment.systemPackages = [
    pkgs.home-manager
  ];
  programs.zsh.enable = true;

  environment.darwinConfig = "$HOME/nix-config/flake.nix";
  ids.gids.nixbld = 350;

  system = {
    primaryUser = "siegi";
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

    activationScripts.activateSettings.text = ''
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
  };
  security.pam.services.sudo_local.touchIdAuth = true;

}
