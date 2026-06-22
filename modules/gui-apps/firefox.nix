{ inputs, ... }:
{
  flake.modules.homeManager.firefox =
    { pkgs, config, lib, ... }:
    let
      nurAddons = inputs.nur.legacyPackages.${pkgs.stdenv.hostPlatform.system}.repos.rycee.firefox-addons;
      noctaliaEnabled = config.programs.noctalia.enable;
    in
    {
      home.packages = lib.mkIf noctaliaEnabled [ pkgs.pywalfox-native ];

      programs.firefox = {
        enable = pkgs.stdenv.isLinux;
        configPath = "${config.xdg.configHome}/mozilla/firefox";
        nativeMessagingHosts = lib.mkIf noctaliaEnabled [ pkgs.pywalfox-native ];
        profiles.default = {
          isDefault = true;
          extensions.packages = with nurAddons; [
            vimium
            proton-pass
          ] ++ lib.optionals noctaliaEnabled [
            nurAddons.pywalfox
          ];
          settings = {
            "browser.toolbars.bookmarks.visibility" = "never";
          };
        };
      };

      home.activation.pywalfox-install = lib.mkIf noctaliaEnabled
        (lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          $DRY_RUN_CMD ${pkgs.pywalfox-native}/bin/pywalfox install
        '');
    };
}
