{ config, pkgs, ... }:
{
  # nix programs
  programs = {
    steam = {
        enable = true;
        dedicatedServer.openFirewall = false; # sauce™ servers
        remotePlay.openFirewall = true; # remote play
    };
  };
  
  # other nix packages
  environment.systemPackages = with pkgs; [
    # apps
    immersed-vr
    blender
    trigger-control
    libsForQt5.kdenlive
    davinci-resolve
    natron
    # emulators
    citra-nightly
    yuzu-mainline
    dolphin-emu
  ];
}
