{
  flake.modules.homeManager.mail = {
    services.protonmail-bridge.enable = true;
    accounts.email = {
      maildirBasePath = ".mail";
      accounts.email.accounts."proton" =
        let
          addr = "ephraim.siegfried@proton.me";
        in
        {
          address = addr;
          realName = "Ephraim Siegfried";
          userName = addr;

          imap = {
            host = "127.0.0.1";
            port = 1143;
            tls.enable = true;
            tls.useStartTLS = true;
          };
          smtp = {
            host = "127.0.0.1";
            port = 1025;
            tls.enable = true;
            tls.useStartTLS = true;
          };
        };
    };

  };
}
