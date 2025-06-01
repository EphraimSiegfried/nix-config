# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  # example = pkgs.callPackage ./example { };
  kidex = pkgs.callPackage ./kidex { };
  sbarlua = pkgs.callPackage ./sbarlua { };
  sketchyhelper = pkgs.callPackage ./sketchyhelper { };
}
