{ self, ... }:
{
  flake.modules.homeManager.nh = {
    programs.nh = {
      enable = true;
      flake = "~/nix-config";
    };
  };
}
