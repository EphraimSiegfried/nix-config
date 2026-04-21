{

  flake.modules.nixos.virtualisation = {
    virtualisation.docker = {
      enable = true;
      rootless.enable = true;
    };
  };
}
