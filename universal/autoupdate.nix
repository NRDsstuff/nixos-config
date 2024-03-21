{ config, pkgs, ... }:

{
  system.autoUpgrade = {
    enable = true;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "20:00";
    randomizedDelaySec = "45min";
  };
}
