{ config, pkgs, ... }:
{
  imports = [
    ./lsp.nix
    ./conform.nix
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

    bufferline.enable = true;

    trouble.enable = true;

    inc-rename = {
      enable = true;
      # inputBufferType = "dressing";
    };

    navic = {
      enable = true;
      settings.lsp.auto_attach = true;
    };

    # lualine = {
    #   enable = true;
    #   settings = {
    #     options = {
    #       disabled_filetypes = {
    #         __unkeyed-1 = "alpha";
    #         __unkeyed-2 = "neo-tree";
    #       };
    #       globalstatus = true;
    #     };
    #     winbar = {
    #       lualine_c = [
    #         {
    #           __unkeyed = "navic";
    #         }
    #       ];
    #     };
    #   };
    # };

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
    treesitter-textobjects = {
      enable = true;
      autoLoad = true;
      settings = {
        enable = true;
        keymaps = {
          ab = "@block.outer";
          ac = "@call.outer";
          ib = "@block.inner";
          ic = "@call.inner";
          af = "@function.outer";
          "if" = "@function.inner";
        };
        lookahead = true;
      };

    };

    neo-tree = {
      enable = true;
      settings.filesystem.follow_current_file.enabled = true;
    };

    indent-blankline.enable = true;

    wilder = {
      enable = true;
      settings.modes = [
        ":"
        "/"
        "?"
      ];
    };
    colorizer.enable = true;

    tmux-navigator.enable = true;

    gitsigns.enable = true;

    transparent.enable = true;

    markdown-preview.enable = true;

    typst-preview = {
      enable = true;
      settings = {
        debug = true;
        port = 8000;
        get_main_file = config.lib.nixvim.mkRaw "
	function(path_of_buffer)
	  local root = os.getenv('TYPST_ROOT')
	  if root then
	    return root..'/main.typ'
	  end
	  return path_of_buffer
	end
	";

      };
    };
  };
}
