{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = false;
    };

    taps = [ ];

    brews = [
      "ifstat" # used in sketchybar
      "mas"
      "nmap"
      "iproute2mac"
    ];

    casks = [
      "sf-symbols" #used in sketchybar

      "alfred"
      "discord"
      "whatsapp"
      "spotify"
      "firefox"
      "qbittorrent"
      "vlc"
      "virtualbox"
      "balenaetcher"
    ];
    masApps = {
      "Wireguard" = 1451685025;
    };
  };


}
