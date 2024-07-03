{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zoxide
    tldr
  ];
  programs.eza = {
    enable = true;
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      # TODO:Find better solution for path and name
      uhome = "home-manager switch -I ~/nix-config/flake.nix --flake .#siegi@blinkybill";
      unixos = "nixos-rebuild switch --flake .#blinkybill";
      lg = "lazygit"; # TODO: Might move to git module?
    };
    oh-my-zsh = {
      enable = true;
      theme = "refined";
      plugins = [ "zoxide" "vi-mode" ];
    };

    initExtra =
      "
    VI_MODE_SET_CURSOR=true

    function run(){
      nix-shell --quiet -p $1 --run \"$*\"
    }
    ";
  };

}
