{
  flake.modules.nixos.steam =
    { pkgs, ... }:
    {
      programs.steam = {
        enable = true;
        extraCompatPackages = [ pkgs.proton-ge-bin ];
      };
      environment.sessionVariables.STEAM_FORCE_DESKTOPUI_SCALING = "1.5";
      programs.gamemode.enable = true;
    };
}
