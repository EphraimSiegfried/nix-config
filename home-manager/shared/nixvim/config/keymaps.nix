{ lib, ... }:
{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        key = "<leader>d";
      }
      {
        action = "<cmd>bprevious<CR>";
        key = "H";
      }
      {
        action = "<cmd>bnext<CR>";
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
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
        key = "<leader>xx";
      }
      {
        action = "<cmd>:TermExec cmd=\"clear;python %\" direction=vertical size=60<cr>";
        key = "<leader>r";
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
        action = ":IncRename ";
        key = "<leader>rn";
      }
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
