{
  programs.nixvim.plugins.alpha.enable = true;
  programs.nixvim.plugins.alpha.theme = "dashboard";

  programs.nixvim.extraConfigLua = ''
          local logo = {
              [[                                     ,]],
              [[              ,-.       _,---._ __  / \]],
              [[             /  )    .-'       `./ /   \]],
              [[            (  (   ,'            `/    /|]],
              [[             \  `-"             \'\   / |]],
              [[              `.              ,  \ \ /  |]],
              [[               /`.          ,'-`----Y   |]],
              [[              (            ;        |   ']],
              [[              |  ,-.    ,-'         |  /]],
              [[              |  | (   |       nvim | /]],
              [[              )  |  \  `.___________|/]],
              [[              `--'   `--']],
          }
    	  local alpha = require("alpha")
    	  local dashboard = require("alpha.themes.dashboard")
    	  dashboard.section.header.val = logo

    	  dashboard.section.buttons.val = {
    		  dashboard.button("e", "   New file", ":ene <bar> startinsert <cr>"),
    		  dashboard.button("f", "   Find file", ":Telescope find_files<cr>"),
    		  dashboard.button("r", "   Recent", ":Telescope oldfiles<cr>"),
    		  dashboard.button("q", "   Quit nvim", ":qa<CR>"),
    	  }

    	  alpha.setup(dashboard.opts)
  '';
}
