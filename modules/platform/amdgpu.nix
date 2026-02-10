{
  flake.modules.nixos.amdgpu = {
    boot.initrd.kernelModules = [ "amdgpu" ];
    services.xserver.videoDrivers = [ "amdgpu" ];
  };
}
