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
      "drawio"
      "pycharm"
      "zoom"
      "datagrip"
      "sioyek"
      "docker"
      "intellij-idea"
      "utm"
      "wireshark"
      "webstorm"
      "skim"
      "jellyfin-media-player"
      "rustrover"
      "obsidian"
      "brave-browser"
      "threema"
      "telegram"
      "onlyoffice"
      "spotify"
      "protonvpn"
      "proton-mail"
      "proton-drive"
      # "eddie"
    ];
    # masApps = {
    #   "Wireguard" = 1451685025;
    # };
  };

}
