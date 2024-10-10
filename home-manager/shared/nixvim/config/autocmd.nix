{
  programs.nixvim = {
    autoCmd = [
      {
        desc = "Highlight when yanking (copying) text";
        event = [ "textyankpost" ];
        callback = {
          __raw = "function() vim.highlight.on_yank() end";
        };
      }
      {
        desc = "Open file at the last position it was opened";
        event = [ "BufReadPost" ];
        command = ''silent! normal! g`"zv'';
      }
    ];
  };
}
