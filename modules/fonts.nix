{
  flake.modules.homeManager.fonts =
    { pkgs, ... }:
    {
      home.packages = with pkgs.nerd-fonts; [
        fira-code
        droid-sans-mono
        hack
        meslo-lg
        monaspace
      ];
    };

  flake.modules.nixos.fonts = {
    fonts.enableDefaultPackages = true;
  };
}
