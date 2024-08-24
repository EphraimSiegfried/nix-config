{ pkgs, config, inputs, ... }: {
  imports = [
    inputs.nur.hmModules.nur
  ];
  programs.firefox = {
    enable = true;
    profiles.siegi = {
      isDefault = true;
      extensions = with config.nur.repos.rycee.firefox-addons; [
        vimium-c
        darkreader
      ];
      settings = {
        "extensions.autoDisableScopes" = 0; #automatically enable extensions
      };
    };
  };
}
