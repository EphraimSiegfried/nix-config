# Remap Caps Lock to esc
# https://github.com/jtroo/kanata/blob/main/docs/config.adoc#deflayermap
{
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
}
