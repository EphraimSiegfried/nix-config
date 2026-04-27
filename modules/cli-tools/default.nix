# adds cli tools without configuration
# and imports modules with apps which have configuation
{ inputs, ... }:
{
  flake.modules.darwin.cli_tools = {
    homebrew = {
      enable = true;
      onActivation = {
        cleanup = "zap";
        autoUpdate = false;
      };

      brews = [
        "mas"
        "nmap"
        "iproute2mac"
      ];
    };
  };

  flake.modules.homeManager.cli_tools =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        man-pages
        home-manager
        curl
        yazi
        zoxide
        tldr
        eza
        jq
        fd
        ripgrep
        devenv
        comma
        nix-index
        tree
        lazygit
        gh
        claude-code
        # direnv
        openconnect
      ];
      imports = with inputs.self.modules.homeManager; [
        ssh
        tmux
        nh
        git
        nixvim
        zsh
      ];
      programs.direnv = {
        enable = true;
        silent = true;
        package = pkgs.direnv.overrideAttrs (old: {
          doCheck = false;
        });
        nix-direnv.enable = true;
      };
    };
}
