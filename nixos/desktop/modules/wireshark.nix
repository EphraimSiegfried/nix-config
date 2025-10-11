{ pkgs, ... }: {
  programs.wireshark = {
    enable = true;
    dumpcap.enable = true;
  };
  environment.systemPackages = [
    pkgs.wireshark
  ];
}
