{
  homebrew = {
    enable = true;
    onActivation.autoUpdate = false;
    taps = [ ];

    brews = [
      "ifstat" # used in sketchybar
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
  };
}
