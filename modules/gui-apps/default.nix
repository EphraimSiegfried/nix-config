# adds gui apps without configuration
# and imports modules with apps which have configuation
{ inputs, ... }:
{
  flake.modules.homeManager.gui_apps =
    { pkgs, lib, ... }:
    let
      wrapWithFlags =
        pkg: flags:
        pkgs.symlinkJoin {
          name = "${pkg.pname}-wrapped";
          paths = [ pkg ];
          nativeBuildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            	      wrapProgram $out/bin/${pkg.pname} \
            		--add-flags "${lib.concatStringsSep " " flags}"
            	    '';
        };

      gpuFlags = [
        "--use-gl=desktop"
        "--enable-features=VaapiVideoDecoder"
      ];
    in
    {
      home.packages =
        with pkgs;
        [
          zathura
          meld
          # wrap electron/chromium apps
          (wrapWithFlags spotify gpuFlags)
          (wrapWithFlags obsidian gpuFlags)
          (wrapWithFlags discord gpuFlags)
          (brave.override { commandLineArgs = gpuFlags; })
          wireshark
        ]
        ++ lib.optionals stdenv.isLinux [
          vlc
          pavucontrol
          libreoffice
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
      ];
    };
  };
}
