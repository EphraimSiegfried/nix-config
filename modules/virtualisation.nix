{

  flake.modules.nixos.virtualisation =
    { pkgs, ... }:
    {
      virtualisation.docker = {
        enable = true;
        rootless.enable = true;
        rootless.package = pkgs.docker_29;
        package = pkgs.docker_29;
      };
    };
}
