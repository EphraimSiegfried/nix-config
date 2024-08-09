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
    shellAliases =
      let
        system_command =
          if pkgs.system == "x86_64-darwin"
          then "darwin-rebuild"
          else "sudo nixos-rebuild";
      in
      {
        # TODO:Find better solution for path and name
        uhome = "home-manager switch --flake ~/nix-config/flake.nix#$(whoami)@$(hostname)";
        usys = "${system_command} switch --flake ~/nix-config/flake.nix#$(hostname)";
        lg = "lazygit"; # TODO: Might move to git module?
      };
    oh-my-zsh = {
      enable = true;
      plugins = [
        " zoxide "
        "
          vi-mode "
      ];
    };

    initExtra =
      "
          VI_MODE_SET_CURSOR=true

        function run(){
        nix-shell --quiet -p $1 --run \"$*\"
    }
    ";
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
