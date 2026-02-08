{ self, ... }:
{

  flake.modules.homeManager.zsh =
    { pkgs, ... }:
    let
      util_functions = builtins.readFile ./util.sh;
      system = pkgs.stdenv.hostPlatform.system;
    in
    {
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
            system_command = if system == "aarch64-darwin" then "sudo darwin-rebuild" else "sudo nixos-rebuild";
            open_command = if system == "aarch64-darwin" then "open" else "xdg-open";
          in
          {
            uhome = "home-manager switch --flake ${self}#$(whoami)@$(hostname)";
            usys = "${system_command} switch --flake ${self}#$(hostname)";
            lg = "lazygit";
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

        initContent = ''
          ${pkgs.nix-your-shell}/bin/nix-your-shell zsh | source /dev/stdin
          	VI_MODE_SET_CURSOR=true
        ''
        + util_functions;
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
    };
}
