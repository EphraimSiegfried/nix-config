{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    plugins = with pkgs;
      [
        tmuxPlugins.better-mouse-mode
        tmuxPlugins.t-smart-tmux-session-manager
	tmuxPlugins.catppuccin
      ];
  };
}
