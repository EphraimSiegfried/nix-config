{ inputs, ... }:
{
  flake.modules.homeManager.nixvim =
    { config, lib, ... }:
    let
      noctaliaEnabled = config.programs.noctalia.enable;
      templateLua = ''
        local M = {}
        function M.setup()
          require('base16-colorscheme').setup {
            base00 = '{{colors.surface.default.hex}}',
            base01 = '{{colors.surface_container.default.hex}}',
            base02 = '{{colors.surface_container_high.default.hex}}',
            base03 = '{{colors.outline.default.hex}}',
            base04 = '{{colors.on_surface_variant.default.hex}}',
            base05 = '{{colors.on_surface.default.hex}}',
            base06 = '{{colors.inverse_surface.default.hex}}',
            base07 = '{{colors.on_background.default.hex}}',
            base08 = '{{colors.error.default.hex}}',
            base09 = '{{colors.tertiary.default.hex}}',
            base0A = '{{colors.secondary.default.hex}}',
            base0B = '{{colors.primary.default.hex}}',
            base0C = '{{colors.tertiary.default.hex}}',
            base0D = '{{colors.primary.default.hex}}',
            base0E = '{{colors.inverse_primary.default.hex}}',
            base0F = '{{colors.error.default.hex}}'
          }
        end

        local signal = vim.uv.new_signal()
        signal:start('sigusr1', vim.schedule_wrap(function()
          package.loaded['noctalia-colors'] = nil
          require('noctalia-colors').setup()
        end))

        return M
      '';
    in
    {
      programs.nixvim.colorschemes.kanagawa.enable = lib.mkIf (!noctaliaEnabled) true;

      programs.nixvim.colorschemes.base16 = lib.mkIf noctaliaEnabled {
        enable = true;
      };

      programs.nixvim.extraConfigLua = lib.mkIf noctaliaEnabled ''
        local ok, noctalia = pcall(require, 'noctalia-colors')
        if ok then noctalia.setup() end
      '';

      programs.nixvim.opts = lib.mkIf noctaliaEnabled {
        guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor";
      };

      programs.nixvim.highlightOverride = lib.mkIf noctaliaEnabled {
        Cursor = { fg = "#000000"; bg = "#ffffff"; };
      };

      # Template file for noctalia color generation
      xdg.configFile = lib.mkIf noctaliaEnabled {
        "nvim/lua/noctalia-colors-template.lua".text = templateLua;
      };

      # Register the template with noctalia
      programs.noctalia.settings.theme.templates.user.nvim-base16 = lib.mkIf noctaliaEnabled {
        input_path = "~/.config/nvim/lua/noctalia-colors-template.lua";
        output_path = "~/.config/nvim/lua/noctalia-colors.lua";
        post_hook = "pkill -SIGUSR1 nvim";
      };
    };
}
