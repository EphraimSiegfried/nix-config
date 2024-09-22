{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./alpha.nix
    ./toggleterm.nix
  ];
  home.packages = with pkgs; [
    ripgrep
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
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
      # {
      #   action = "<cmd>ToggleTerm<CR>";
      #   key = "<C-x>";
      # }
      {
        action = "<cmd>VimtexCompile<CR>";
        key = "<leader>ll";
      }
      {
        action = "v:count == 0 ? 'gj': 'j'";
        key = "j";
        options.expr = true;
        mode = [
          "n"
          "x"
        ];
      }
      {
        action = "v:count == 0 ? 'gk': 'k'";
        key = "k";
        options.expr = true;
        mode = [
          "n"
          "x"
        ];
      }
      {
        # Clear search with <esc>
        action = "<cmd>noh<cr><esc>";
        key = "<esc>";
        mode = [
          "i"
          "n"
        ];
      }
    ];


    colorschemes.catppuccin = {
      enable = true;
    };

    plugins = {
      lsp = {
        enable = true;
        servers = {
          # webdev
          # tsserver.enable = true; // already enabled with prettier
          tailwindcss.enable = true;
          eslint.enable = true;
          html.enable = true;
          cssls.enable = true;

          nixd.enable = true;
          ccls.enable = true;
          texlab.enable = true;
          pyright.enable = true;
          bashls.enable = true;
        };
      };
      # clangd-extensions.enable = true;


      none-ls = {
        enable = true;
        enableLspFormat = true;
        sources.formatting = {
          nixpkgs_fmt.enable = true;
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

      surround.enable = true;

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

      telescope = {
        enable = true;
        settings = {
          defaults = {
            path_display = "truncate";
            mappings = {
              i = {
                "<C-j>" = {
                  __raw = "require('telescope.actions').move_selection_next";
                };
                "<C-k>" = {
                  __raw = "require('telescope.actions').move_selection_previous";
                };
              };
            };
          };
        };
      };

      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      neo-tree = {
        enable = true;
      };

      indent-blankline.enable = true;

      nvim-colorizer.enable = true;

      tmux-navigator.enable = true;

      gitsigns.enable = true;

      transparent.enable = true;


      markdown-preview.enable = true;

      # auto-save.enable = true;
      vimtex = {
        enable = true;
        settings = {
          indent_enabled = "1";
          syntax_enabled = "1";
          complete_enabled = "1";
          tex_conceal = "abdmg";
          view_method = "zathura";
        };
      };
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
