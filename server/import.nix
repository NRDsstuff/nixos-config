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
        ../users/server/cnb.nix
        ../users/server/meowster.nix
        ../users/server/jeyphr.nix
        ../users/server/ecodz.nix
        ../users/server/lenni.nix
        # other
    ];
}