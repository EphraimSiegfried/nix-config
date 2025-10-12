{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "definition-or-references";
        src = pkgs.fetchFromGitHub {
          owner = "KostkaBrukowa";
          repo = "definition-or-references.nvim";
          rev = "13570f9";
          hash = "sha256-4SBdizH1/WYc9KYtVZP7YmzF5CEhCEW3dkIqMgP/JT0=";
        };
      })
    ];
    extraConfigLua = ''
      require("definition-or-references").setup({});
    '';
    keymaps = [
      {
        action = ''<cmd> lua require("definition-or-references").definition_or_references() <cr>'';
        key = "gd";
      }
    ];
  };
}
