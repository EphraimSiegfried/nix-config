{ pkgs, config, ... }: {
  sops.secrets."nextcloud/admin_pw" = {
    owner = "nextcloud";
    group = "nextcloud";
  };
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud31;
    hostName = "cloud.${config.domain}";
    home = "${config.dataDir}/nextcloud";
    database.createLocally = true;
    maxUploadSize = "16G";
    https = true;
    config = {
      adminuser = "siegi";
      adminpassFile = config.sops.secrets."nextcloud/admin_pw".path;
      dbtype = "sqlite";
    };
  };

  services.nginx.virtualHosts."cloud.${config.domain}" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      recommendedProxySettings = true;
      proxyWebsockets = true;
    };
  };
}
