{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: { inherit (tpkgs) scheme-full a4wide; };
  };
  programs.zathura = {
    enable = true;
  };
}
