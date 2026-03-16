{
  flake.modules.nixos.keyboard = {
    i18n.defaultLocale = "en_US.UTF-8";
    services.xserver = {
      xkb.layout = "us";
      xkb.variant = "";
    };
    # Remap Caps Lock to esc
    services.kanata = {
      enable = true;
      keyboards = {
        # name of keyboard is arbitrary, works with all keyboards
        "keychron".config = ''
          (defsrc)
          (deflayermap (base-layer)
            caps esc
          )      '';
      };
    };
  };

  # additionally swaps alt and super keys
  flake.modules.nixos.keyboard-macbook = {
    services.kanata = {
      enable = true;
      keyboards = {
        "macbook".config = ''
          (defsrc
            caps lmet lalt ralt rmet
          )

          (deflayer base
            esc  lalt lmet rmet ralt
          )
        '';
      };
    };
  };

  flake.modules.darwin.keyboard = {
    system.defaults.keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
}
