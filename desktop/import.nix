{ config, pkgs, ... }:

{
    imports = [
        ./boot.nix
        ./disks.nix
        ./graphics.nix
        ./networking.nix
        ./pkgs.nix
        ./synced-folders.nix
        ./virtualization.nix
        # users
        ../users/gui/gutek.nix
        ../users/gui/nrd.nix
        # other
        ../universal/pkgs.nix
        ../universal/desktop.nix
    ];
}