# Darwin Settings I don't know where to put yet
# TODO: refactor
{ config, ... }:
{
  flake.modules.darwin.system_defaults = {
    system = {
      defaults = {
        NSGlobalDomain = {
          "com.apple.sound.beep.feedback" = 0;
          "com.apple.sound.beep.volume" = 0.0;
        };

        screencapture.location = "Users/${config.primaryUser.username}/Pictures/screenshots";
      };

      activationScripts.activateSettings.text = ''
        /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
      '';
    };
    security.pam.services.sudo_local.touchIdAuth = true;
  };
}
