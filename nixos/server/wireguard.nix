{ pkgs, config, ... }:
let
  externalInterface = "enp0s20u3";
in
{
  sops.secrets."vpn/server/private_key" = { };
  networking.nat.enable = true;
  networking.nat.externalInterface = externalInterface;
  networking.nat.internalInterfaces = [ "wg0" ];
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wireguard.interfaces.wg0 = {
    ips = [ "10.100.0.1/24" ];
    listenPort = 51820;
    #public key: ME2v/lPTgrq5LgVidumHFgwYY4StERLu3YcyHR45SVY=
    privateKeyFile = config.sops.secrets."vpn/server/private_key".path;
    # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
    # For this to work you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients
    postSetup = ''
      ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o ${externalInterface} -j MASQUERADE
    '';

    # This undoes the above command
    postShutdown = ''
      ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o ${externalInterface} -j MASQUERADE
    '';
    peers = [
      {
        # phone 
        publicKey = "Sqj6Z9tL4YbVUKDYBbieMfJoavf1pnkSqTCRBaotUF0=";
        allowedIPs = [ "10.100.0.2/32" ];
      }
      {
        # macbook 
        publicKey = "7xuchR8Ai/LmyEtYsL/P/f3DsWlCfXoH3CbtvZi0qFU=";
        allowedIPs = [ "10.100.0.3/32" ];
      }
      {
        # rahel 
        publicKey = "doZ/D2C8syYEmbJUiv7HT6f6rJkpJmx9GY52f7XchH0=";
        allowedIPs = [ "10.100.0.4/32" ];
      }
    ];
  };
}
