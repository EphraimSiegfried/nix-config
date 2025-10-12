{
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.nur.modules.homeManager.default
  ];
  programs.firefox = {
    enable = true;
    profiles.siegi = {
      isDefault = true;
      # extensions = with config.nur.repos.rycee.firefox-addons; [
      #   vimium-c
      #   darkreader
      #   bitwarden
      # ];
      settings = {
        "extensions.autoDisableScopes" = 0; # automatically enable extensions
      };
    };
  };
}
