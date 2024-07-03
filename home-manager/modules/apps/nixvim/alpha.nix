{
  programs.nixvim.plugins.alpha = {
    enable = true;
    iconsEnabled = true;
    layout =
      [
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "Type";
            position = "center";
          };
          type = "text";
          val = [
            "                                     ,"
            "              ,-.       _,---._ __  / \\"
            "             /  )    .-'       `./ /   \\"
            "            (  (   ,'            `/    /|"
            "             \\  `-\"             \\'\\   / |"
            "              `.              ,  \\ \\ /  |"
            "               /`.          ,'-`----Y   |"
            "              (            ;        |   '"
            "              |  ,-.    ,-'         |  /"
            "              |  | (   |       nvim | /"
            "              )  |  \\  `.___________|/"
            "              `--'   `--"
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          opts.position = "center";
          val = [
            {
              on_press = {
                __raw = "function() vim.cmd[[ene]] end";
              };
              opts = {
                shortcut = "n";
              };
              type = "button";
              val = "  New file";
            }
            {
              on_press = {
                __raw = "function() vim.cmd[[qa]] end";
              };
              opts = {
                shortcut = "q";
              };
              type = "button";
              val = " Quit Neovim";
            }
          ];
        }
        {
          type = "padding";
          val = 2;
        }
      ];

  };

}
