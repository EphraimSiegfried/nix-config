{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./config/keymaps.nix
    ./config/options.nix
    ./config/autocmd.nix
    ./plugins/plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.catppuccin.enable = true;
  };
}
