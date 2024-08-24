{

  programs.nixvim.plugins.toggleterm = {
    enable = true;
    settings = {
      open_mapping = "[[<C-x>]]";
      start_in_insert = true;
    };
  };

  programs.nixvim.keymaps = [{
    action = "<cmd>lua _lazygit_toggle()<CR>";
    key = "<leader>g";
  }];


  programs.nixvim.extraConfigLua = ''
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
          cmd = "lazygit",
          dir = "git_dir",
          direction = "float",
          float_opts = {
    		border = "double",
    	},
    	-- function to run on opening the terminal
    	on_open = function(term)
    		vim.cmd("startinsert!")
    		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    	end,
    	-- function to run on closing the terminal
    	on_close = function(term)
    		vim.cmd("startinsert!")
    	end,
    })

    function _lazygit_toggle()
    	lazygit:toggle()
    end
  '';

}
