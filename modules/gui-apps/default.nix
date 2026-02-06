# adds gui apps without configuration
# and imports modules with apps which have configuation
{ inputs, ... }:
{
  flake.modules.homeManager.gui_apps =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        zed
        kitty
      ];

      home.packages = with pkgs; [
        zathura
        meld
      ];
    };

  flake.modules.darwin.gui_apps = {
    homebrew = {
      enable = true;
      onActivation = {
        cleanup = "zap";
        autoUpdate = false;
      };
      casks = [
        "firefox"
        "qbittorrent"
        "vlc"
        "virtualbox"
        "balenaetcher"
        "drawio"
        "pycharm"
        "zoom"
        "datagrip"
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
      ];
    };
  };
}
