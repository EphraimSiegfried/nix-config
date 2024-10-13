{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        action = "bprev";
        key = "H";
      }
      {
        action = "bnext";
        key = "L";
      }
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
  };
}
