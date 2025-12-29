{ pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home.packages = [
    pkgs.texlive.combined.scheme-full
  ];
  programs.nixvim = {
    lsp.servers = {
      texlab.enable = true;
    };
    plugins = {
      vimtex = {
        enable = true;
        texlivePackage = pkgs.texlive.combined.scheme-full;
        settings = {
          indent_enabled = "1";
          syntax_enabled = "1";
          complete_enabled = "1";
          tex_conceal = "abdmg";
          view_method = if system == "aarch64-darwin" then "skim" else "zathura";
        };
      };
      treesitter.settings.highlight.disable = [ "latex" ];

    };

    keymaps = [
      {
        action = "<cmd>VimtexCompile<CR>";
        key = "<leader>ll";
      }
    ];
  };

}
