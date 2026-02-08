{
  flake.modules.darwin.system_defaults = {
    system = {
      defaults = {
        NSGlobalDomain = {
          "com.apple.sound.beep.feedback" = 0;
          "com.apple.sound.beep.volume" = 0.0;
          AppleShowAllExtensions = true;
        };

        # TODO: Use a variable for home location
        screencapture.location = "Users/siegi/Pictures/screenshots";
      };

      activationScripts.activateSettings.text = ''
        /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
      '';
    };
    security.pam.services.sudo_local.touchIdAuth = true;
  };
}
