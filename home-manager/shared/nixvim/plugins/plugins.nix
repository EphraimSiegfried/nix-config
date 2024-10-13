{ pkgs, ... }: {
  imports = [
    ./lsp.nix
    ./extra/alpha.nix
    ./extra/markdown.nix
    ./extra/toggleterm.nix
    ./extra/definitions-or-references.nix
    ./snippet.nix
  ];
  home.packages = with pkgs; [
    ripgrep
  ];
  programs.nixvim.plugins = {

    web-devicons.enable = true;

    nvim-surround.enable = true;



    harpoon = {
      enable = true;
      keymaps = {
        addFile = "<leader>h";
        toggleQuickMenu = "<leader>H";
        navNext = "<Tab>";
        navPrev = "<S-Tab>";
      };
    };

    navic = {
      enable = true;
      settings.lsp.auto_attach = true;
    };

    lualine = {
      enable = true;
      settings = {
        options = {
          disabled_filetypes = {
            __unkeyed-1 = "alpha";
            __unkeyed-2 = "neo-tree";
          };
          globalstatus = true;
        };
        winbar = {
          lualine_c = [
            {
              __unkeyed = "navic";
            }
          ];
        };
      };

    };

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

    wilder = {
      enable = true;
      modes = [ ":" "/" "?" ];
    };
    nvim-colorizer.enable = true;

    tmux-navigator.enable = true;

    gitsigns.enable = true;

    transparent.enable = true;


    markdown-preview.enable = true;

    # auto-save.enable = true;
    vimtex = {
      enable = true;
      texlivePackage = pkgs.texlive.combined.scheme-full;
      settings = {
        indent_enabled = "1";
        syntax_enabled = "1";
        complete_enabled = "1";
        tex_conceal = "abdmg";
        view_method = "zathura";
      };
    };
  };
}
