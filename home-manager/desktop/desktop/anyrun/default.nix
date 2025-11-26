{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [ kidex ];
  imports = [
    # inputs.anyrun.homeManagerModules.default
  ];
  programs.anyrun = {
    enable = true;
    config = {
      y.fraction = 0.3;
      width.fraction = 0.25;
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = 10;

      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
        # "${pkgs.anyrun}/lib/libkidex.so"
      ];

    };
    # extraConfigFiles."kidex".text = ''
    #   Config(
    #     max_extries : 3,
    #     ignored: [], // A list of patterns to be ignored in all directories
    #     directories: [
    #       WatchDir(
    #         path: "/home/siegi/Downloads", // The root folder to be indexed
    #         recurse: true, // Recursively index and watch all subfolders
    #         ignored: [], // Ignore patterns specifically for this directory
    #       ),
    #       ],
    #     )
    # '';
    # copied from https://github.com/fufexan/dotfiles/blob/main/home/programs/anyrun/style-dark.css
    extraCss = builtins.readFile ./style.css;
  };
}
