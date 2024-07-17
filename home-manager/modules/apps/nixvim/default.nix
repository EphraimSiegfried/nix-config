{ pkgs, ... }: {
  home.packages = with pkgs; [
    ripgrep
  ];
  imports = [
  ];
  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      clipboard = "unnamedplus";
    };

    globals.mapleader = " ";
    keymaps = [
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fs";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>e";
      }
      {
        action = "<cmd>Neotree reveal<CR>";
        key = "<leader>E";
      }
      {
        action = "<cmd>ToggleTerm<CR>";
        key = "<C-x>";
      }
    ];


    colorschemes.catppuccin = {
      enable = true;
    };

    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          cssls.enable = true;
          ccls.enable = true;
        };
      };
      # clangd-extensions.enable = true;


      none-ls = {
        enable = true;
        enableLspFormat = true;
        sources.formatting = {
          nixpkgs_fmt.enable = true;
        };
      };
      lsp-format.enable = true;

      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };
      };

      navic = {
        enable = true;
        lsp.autoAttach = true;
      };

      luasnip.enable = true;
      friendly-snippets.enable = true;

      lualine.enable = true;

      nvim-autopairs = {
        enable = true;
        settings.check_ts = true; # use TreeSitter
      };

      telescope.enable = true;

      treesitter = {
        enable = true;
        indent = true;
      };

      neo-tree = {
        enable = true;
      };

      indent-blankline.enable = true;

      nvim-colorizer.enable = true;

      tmux-navigator.enable = true;

      gitsigns.enable = true;

      toggleterm = {
        enable = true;
      };

      markdown-preview.enable = true;
    };

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "markdown";
        src = pkgs.fetchFromGitHub {
          owner = "MeanderingProgrammer";
          repo = "markdown.nvim";
          rev = "fca2903";
          hash = "sha256-OvN+op1XPI/TJQ4lYWyr+lAIwX7fIbERNA3ccooEnAo=";
        };
      })
    ];
    extraConfigLua = ''
      require("render-markdown").setup({});
    '';
  };
}
