# adds gui apps without configuration
# and imports modules with apps which have configuation
{ inputs, ... }:
{
  flake.modules.homeManager.gui_apps =
    { pkgs, ... }:
    {
      home.packages =
        with pkgs;
        [
          zathura
          meld
          drawio
          brave
          spotify
          wireshark
          obsidian
          qbittorrent
        ]
        ++ lib.optionals stdenv.isLinux [
          vlc
          pavucontrol
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
        "docker"
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
      ];
    };
  };
}
