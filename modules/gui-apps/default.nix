# adds gui apps without configuration
# and imports modules with apps which have configuation
{ inputs, ... }:
{
  flake.modules.homeManager.gui_apps =
    { pkgs, lib, ... }:
    {
      home.packages =
        with pkgs;
        [
          zathura
          meld
          wireshark
        ]
        ++ lib.optionals stdenv.isLinux [
          qbittorrent
          vlc
          pavucontrol
          libreoffice
          eddie
          spotify
          obsidian
          discord
          brave
        ];

      imports = with inputs.self.modules.homeManager; [
        zed
        kitty
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
        "vlc"
        "virtualbox"
        "balenaetcher"
        "pycharm"
        "zoom"
        "datagrip"
        "docker-desktop"
        "intellij-idea"
        "utm"
        "webstorm"
        "skim"
        "rustrover"
        "threema"
        "onlyoffice"
        "protonvpn"
        "proton-mail"
        "proton-drive"
        "spotify"
        "brave-browser"
        "firefox"
        "obsidian"
        # work related stuff
        "slack"
        "microsoft-powerpoint"
      ];
    };
  };
}
