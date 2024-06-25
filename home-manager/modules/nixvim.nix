{ pkgs, ... }: {
  home.packages = with pkgs; [
    ripgrep
  ];
  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
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
	};
      };

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
	enable=true;
      };

      toggleterm = {
	enable = true;
      };
    };
  };
}
