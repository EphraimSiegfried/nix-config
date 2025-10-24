{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = false;
    };

    taps = [
      "FelixKratz/formulae"
      "KatharaFramework/kathara"
    ];

    brews = [
      "ifstat" # used in sketchybar
      "mas"
      "nmap"
      "iproute2mac"
      # "sketchybar"
      "postgresql"
    ];

    casks = [
      "sf-symbols" # used in sketchybar
      "firefox"
      "qbittorrent"
      "vlc"
      "virtualbox"
      "balenaetcher"
      "nextcloud"
      "drawio"
      "pycharm"
      "zoom"
      "datagrip"
      "sioyek"
      "docker"
      "utm"
      "intellij-idea"
      "wireshark"
      "webstorm"
      "protonvpn"
      "skim"
      "jellyfin-media-player"
      "rustrover"
      "obsidian"
      "brave-browser"
      "proton-mail"
    ];
    # masApps = {
    #   "Wireguard" = 1451685025;
    # };
  };

}
