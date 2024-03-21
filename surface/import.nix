{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./disks.nix
    ./misc.nix
    ./networking.nix
  ];
}