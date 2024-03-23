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
    ../users/gutek.nix
  ];
}