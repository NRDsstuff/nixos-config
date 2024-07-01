{ config, pkgs, ... }:

{
    # novideo
    hardware.nvidia = {
    
        # package
        package = config.boot.kernelPackages.nvidiaPackages.production;

        # Modesetting is required.
        modesetting.enable = true;

        # this fucks up graphics lol
        powerManagement.enable = false;

        # Fine-grained power management. Turns off GPU when not in use.
        # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        powerManagement.finegrained = false;

        # Use the NVidia open source kernel module (not to be confused with the
        # independent third-party "nouveau" open source driver).
        # Support is limited to the Turing and later architectures. Full list of 
        # supported GPUs is at: 
        # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
        # Only available from driver 515.43.04+
        # Currently alpha-quality/buggy, so false is currently the recommended setting.
        open = false;


        # enable nvidia-settings
        nvidiaSettings = true;
    };
    hardware.nvidia.forceFullCompositionPipeline = true;

    # Enable OpenGL
    hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
    };

    # enable drivers
    services.xserver.videoDrivers = [ "nvidia" ];
}
