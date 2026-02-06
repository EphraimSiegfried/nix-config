{

  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          # TODO: put this in variables
          name = "Ephraim Siegfried";
          email = "ephraim.siegfried@proton.me";
        };
        merge = {
          tool = "nvimdiff2";
          guitool = "meld";
        };
        mergetool = {
          # 'auto' makes git use guitool if display is available
          # guiDefault = "auto";
          guiDefault = true;
        };
      };
    };
  };
}
