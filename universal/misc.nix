{ config, lib, pkgs, modulesPath, ... }:

{
    # i have no idea what this does, i just imported it from hardware-configuration.nix
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.enableRedistributableFirmware = lib.mkDefault true;
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    environment.variables = {
        GSK_RENDERER = "ngl";
    };
}