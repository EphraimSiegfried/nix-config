{ pkgs, config, lib, ... }: {
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      #: Use Pubkey authentication only
      PasswordAuthentication = false;
    };
  };
}

