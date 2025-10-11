{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userEmail = "ephraim.siegfried@hotmail.com";
    userName = "Ephraim Siegfried";
    extraConfig = {
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
  programs.gh.enable = true;
  programs.lazygit.enable = true;
  home.packages = [ pkgs.meld ];
}
