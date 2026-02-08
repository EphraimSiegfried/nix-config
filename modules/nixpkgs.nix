# Defines default settings for nixpkgs
{
  flake.modules.homeManager.nixpkgs_settings = {
    nixpkgs.config.allowUnfree = true;
  };
}
