{ config, pkgs, ... }:

{
    imports = [
        ./boot.nix
        ./disks.nix
        ./misc.nix
        ./networking.nix
        ./pkgs.nix
        # users
        ../users/server/nrd.nix
        # other
    ];
}