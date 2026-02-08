{
  flake.modules.homeManager.nixpkgs_settings = {
    nixpkgs.config.allowUnfree = true;
  };
}
