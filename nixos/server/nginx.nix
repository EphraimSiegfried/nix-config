{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "vault.qwt.ch" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8002";
          recommendedProxySettings = true;
        };
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "ephraim.siegfried@hotmail.com";
  };
}
