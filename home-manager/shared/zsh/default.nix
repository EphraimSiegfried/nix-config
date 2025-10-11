{ pkgs, ... }:

let
  util_functions = builtins.readFile ./util.sh;
in
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
    shellAliases =
      let
        system_command =
          if pkgs.system == "aarch64-darwin" then "sudo darwin-rebuild" else "sudo nixos-rebuild";
        open_command = if pkgs.system == "aarch64-darwin" then "open" else "xdg-open";
      in
      {
        # TODO:Find better solution for path and name
        uhome = "home-manager switch --flake ~/nix-config#$(whoami)@$(hostname)";
        usys = "${system_command} switch --flake ~/nix-config#$(hostname)";
        lg = "lazygit"; # TODO: Might move to git module?
        open = "${open_command}";
      };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "zoxide"
        "vi-mode"
        "direnv"
      ];
    };

    initContent =
      '' 
	VI_MODE_SET_CURSOR=true
      ''
      + util_functions
    ;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      nix_shell = {
        disabled = false;
        impure_msg = "";
        symbol = "";
        format = "[$symbol$state]($style) ";
      };
    };

  };
}
