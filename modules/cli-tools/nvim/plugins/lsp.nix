{
  flake.modules.homeManager.nixvim = {
    programs.nixvim.plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          tinymist.enable = true; # typst
          tailwindcss.enable = true;
          ts_ls.enable = true;
          emmet_ls.enable = true;
          eslint.enable = true;
          html.enable = true;
          cssls.enable = true;
          docker_compose_language_service.enable = true;
          nixd.enable = true;
          ccls.enable = true;
          pyright.enable = true;
          bashls.enable = true;
          lua_ls.enable = true;
          clangd.enable = true;
          hls = {
            # haskell
            installGhc = true;
            enable = true;
          };
          rust_analyzer = {
            installCargo = true;
            installRustc = true;
            enable = true;
          };
        };
      };
      lsp-signature.enable = true;
      csvview.enable = true;

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
  };
}
