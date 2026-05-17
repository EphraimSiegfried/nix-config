{
  flake.modules.nixos.nautilus =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nautilus
        loupe
        evince
        ffmpegthumbnailer
        gnome-font-viewer
        webp-pixbuf-loader
        librsvg
      ];
      services.gvfs.enable = true;
      services.gnome.sushi.enable = true;
      environment.pathsToLink = [ "/share/thumbnailers" ];
      nixpkgs.overlays = [
        (final: prev: {
          nautilus = prev.nautilus.overrideAttrs (nprev: {
            buildInputs =
              nprev.buildInputs
              ++ (with pkgs.gst_all_1; [
                gst-plugins-good
                gst-plugins-bad
              ]);
          });
        })
      ];
    };
}
