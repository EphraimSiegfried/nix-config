{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "markdown";
        src = pkgs.fetchFromGitHub {
          owner = "MeanderingProgrammer";
          repo = "markdown.nvim";
          rev = "fca2903";
          hash = "sha256-OvN+op1XPI/TJQ4lYWyr+lAIwX7fIbERNA3ccooEnAo=";
        };
      })
    ];
    extraConfigLua = ''
      require("render-markdown").setup({});
    '';
  };

}
