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
    ];
    masApps = {
      "Wireguard" = 1451685025;
    };
  };


}
