{
  flake.modules.homeManager.nixvim =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        ripgrep
      ];
      programs.nixvim.colorschemes = {
        kanagawa.enable = true;
      };

      programs.nixvim.plugins = {

        web-devicons.enable = true;

        nvim-surround.enable = true;

        bufferline.enable = true;

        trouble.enable = true;

        illuminate.enable = true;

        colorizer.enable = true;

        tmux-navigator.enable = true;

        gitsigns.enable = true;

        transparent.enable = true;

        markdown-preview.enable = true;

        indent-blankline.enable = true;

        inc-rename = {
          enable = true;
        };

        navic = {
          enable = true;
          settings.lsp.auto_attach = true;
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

        wilder = {
          enable = true;
          settings.modes = [
            ":"
            "/"
            "?"
          ];
        };

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

        luasnip = {
          enable = true;
          fromVscode = [ { exclude = [ "tex" ]; } ];
          settings = {
            enable_autosnippets = true;
            store_selection_keys = "<Tab>";
            region_check_events = "InsertEnter";
            delete_check_events = "InsertLeave";
          };
        };
        friendly-snippets.enable = true;
      };
    };

}
