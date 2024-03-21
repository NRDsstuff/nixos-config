{ config, pkgs, ... }:
let
    unstable = import <nixos-unstable> { config = { allowUnfree = true; };};
in
{
  imports = [ <home-manager/nixos> ];

  # meow
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # flatpak 
  services.flatpak.enable = true;
  
  # nix pkgs
  programs = {
    steam = {
        enable = true;
        dedicatedServer.openFirewall = false; # sauce™ servers
        remotePlay.openFirewall = true; # remote play
    };
  };
  
  # ææææææææ
  environment.systemPackages = with pkgs; [
    # apps
    immersed-vr
    blender
    inkscape
    trigger-control
    libsForQt5.kdenlive
    davinci-resolve
    natron
    # emulators
    citra-nightly
    yuzu-mainline
    dolphin-emu
  ];
  
  # SHUT THE FUCK UP
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0" 
  ];
  
  # remove bloatware that comes with the DE
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];
  
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    snapshot
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gedit # text editor
    epiphany # web browser
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
  
  # fonts lol
  fonts = {
    packages = with pkgs; [
      atkinson-hyperlegible
      noto-fonts-emoji
      noto-fonts-cjk
      noto-fonts
      fira-code-nerdfont
    ];
  };
}
