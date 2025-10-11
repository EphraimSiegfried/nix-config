{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
          region_check_events = "InsertEnter";
          delete_check_events = "InsertLeave";
        };
        fromLua = [
          {
            paths = [
              ./snippets
            ];
          }
        ];
      };
      luasnip.fromVscode = [ { exclude = [ "tex" ]; } ];
      friendly-snippets.enable = true;
    };

    # extraPlugins = [
    #   (pkgs.vimUtils.buildVimPlugin {
    #     name = "luasnip-latex-snippets";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "evesdropper";
    #       repo = "luasnip-latex-snippets.nvim";
    #       rev = "e72dc5f";
    #       hash = "sha256-OvN+op1XPI/TJQ4lYWyr+lAIwX7fIbERNA3ccooEnAo=";
    #     };
    #   })
    # ];
    #
    # extraConfigLua = ''
    #   require("luasnip-latex-snippets")
    #
    # '';
  };

}
