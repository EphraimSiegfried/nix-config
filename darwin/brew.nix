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
      "sketchybar"
      "postgresql"
    ];

    casks = [
      "sf-symbols" # used in sketchybar
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
      "zoom"
      "datagrip"
      "telegram"
      "raycast"
      "sioyek"
      "docker"
      "kathara"
      "microsoft-excel"
      "utm"
      "intellij-idea"
      "wireshark"
      "zen-browser"
    ];
    masApps = {
      "Wireguard" = 1451685025;
    };
  };

}
