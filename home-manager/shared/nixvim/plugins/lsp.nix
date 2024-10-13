{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        tailwindcss.enable = true;
        eslint.enable = true;
        html.enable = true;
        cssls.enable = true;
        docker-compose-language-service.enable = true;
        nixd.enable = true;
        ccls.enable = true;
        texlab.enable = true;
        pyright.enable = true;
        bashls.enable = true;
      };
    };
    lsp-signature.enable = true;

    none-ls = {
      enable = true;
      enableLspFormat = true;
      sources.formatting = {
        nixpkgs_fmt.enable = true;
        black.enable = true;
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
        };
      };
    };
    lsp-format.enable = true;

    cmp = {
      enable = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({select = true})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };
    };
  };
}
