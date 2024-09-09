{ config, ... }: {
  nixarr = {
    enable = true;
    mediaDir = "${config.dataDir}/media";
    stateDir = "${config.dataDir}/media/.state/nixarr";

    # vpn = {
    #   enable = true;
    #   wgConf = config.sops.secrets."vpn/wg_conf.conf".path;
    # };

    jellyfin = {
      enable = true;
      expose.https = {
        enable = true;
        domainName = "jelly.${config.domain}";
        acmeMail = config.email;
      };
    };

    transmission = {
      enable = true;
      # vpn.enable = true;
      openFirewall = true;
      # peerPort = 23182;
      flood.enable = true;
    };

    prowlarr.enable = true;
    radarr.enable = true;

  };
}
