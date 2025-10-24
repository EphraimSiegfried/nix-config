{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;
    userSettings = {
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      vim_mode = true;
      load_direnv = "shell_hook";
      lsp = {
        nix = {
          binary = {
            path = lib.getExe pkgs.nixd;
          };
        };
      };
    };
    extraPackages = [
      pkgs.nixd
    ];
    extensions = [ "catppuccin" ];
    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          ctrl-x = "workspace::NewTerminal";
        };
      }
    ];
  };
}
