# adds gui apps without configuration
# and imports modules with apps which have configuation
{ inputs, ... }:
{
  flake.modules.nixos.gui_apps = {
    imports = with inputs.self.modules.nixos; [
      nautilus
      steam
    ];
  };

  flake.modules.homeManager.gui_apps =
    { pkgs, lib, ... }:
    let
      isLinux = pkgs.stdenv.isLinux;
    in
    {
      home.packages =
        with pkgs;
        [
          zathura
          meld
          wireshark
        ]
        ++ lib.optionals isLinux [
          qbittorrent
          vlc
          pavucontrol
          libreoffice
          eddie
          spotify
          obsidian
          discord
          brave
          seahorse
          element-desktop
          # work related:
          slack
          zoom-us
          bruno
        ];

      imports = with inputs.self.modules.homeManager; [
        inputs.mac-app-util.homeManagerModules.default
        # zed
        kitty
        sioyek
        ghostty
        firefox
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
        "element"
        "transmission"
        "jellyfin-media-player"
        # work related stuff
        "slack"
        "microsoft-powerpoint"
        "ghostty"
      ];
    };
  };
}
