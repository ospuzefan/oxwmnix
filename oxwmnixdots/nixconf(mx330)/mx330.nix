{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    prime = {
      sync.enable = false;
      offload.enable = true;

      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:43@0:0:0";
    };
  };

  services.xserver.videoDrivers = [ "nvidia" "modesetting" ];
  hardware.nvidia.prime.offload.enableOffloadCmd = true;
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
  ];
}
