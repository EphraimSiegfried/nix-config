{ inputs, ... }:
{
  flake.modules.homeManager.nixvim = {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
    };

    imports = [
      inputs.nixvim.homeModules.nixvim
    ];
  };
}
