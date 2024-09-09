{ config, ... }: {
  services.nginx.virtualHosts."vw.${config.domain}" = {
    # enableACME = true;
    # forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:8002";
      recommendedProxySettings = true;
    };
  };
  services.vaultwarden = {
    enable = true;
    backupDir = config.dataDir + "/vaultwarden";
    config = {
      DOMAIN = " http://vw.${config.domain}";
      SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8002;
      ROCKET_LOG = "critical";
    };
  };
}
