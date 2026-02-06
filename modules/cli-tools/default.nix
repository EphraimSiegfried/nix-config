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
        home-manager
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
        direnv
      ];
      imports = with inputs.self.modules.homeManager; [
        ssh
        tmux
        nh
        git
        nixvim
      ];
    };
}
