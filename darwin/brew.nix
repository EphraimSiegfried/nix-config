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

      "postgresql"
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
      "nextcloud"
      "drawio"
      "visual-studio-code"
      "pycharm"
    ];
    masApps = {
      "Wireguard" = 1451685025;
    };
  };


}
