{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zoxide
      fzf
  ];
  programs.eza = {
    enable = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
    };
    oh-my-zsh = {
      enable = true;
      theme = "refined";
      plugins = ["zoxide" "vi-mode"];
    };  
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
