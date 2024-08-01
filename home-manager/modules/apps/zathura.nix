{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: { inherit (tpkgs) scheme-full; };
  };
  programs.zathura = {
    enable = true;
  };
}
