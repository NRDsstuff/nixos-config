{ config, pkgs, ... }:

{
    imports = [
        ./boot.nix
        ./disks.nix
        ./misc.nix
        ./networking.nix
        # users
        ../users/gui/nrd.nix
        # other
        ../universal/pkgs.nix
        ../universal/desktop.nix
        ../universal/services.nix
    ];
}
