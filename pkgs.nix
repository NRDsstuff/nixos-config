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
    nix-ld.enable = true;
    zsh.enable = true;
  };
  
  # ææææææææ
  environment.systemPackages = (with pkgs; [
    # apps
    thefuck
    bun
    tuba
    citra-nightly
    wget
    telegram-desktop
    prismlauncher
    natron
    davinci-resolve
    trigger-control
    gnome.gnome-tweaks
    libsForQt5.kdenlive
    gnome.gnome-software
    nodejs
    home-manager
    firefox
    chromium
    immersed-vr
    lollypop
    obsidian
    inkscape
    gnome.dconf-editor
    blender
    gnome.mutter
    killall
    android-tools
    vscode
    yuzu-mainline
    dolphin-emu
    zulu8
    libreoffice
    dconf2nix
  ]) ++ (with pkgs.gnomeExtensions; [
    # gnome extensions
    extension-list
    steal-my-focus-window
    alphabetical-app-grid
    forge
    app-hider
    blur-my-shell
    caffeine
    unmess
    pano
    gsconnect
    mpris-label
    tray-icons-reloaded
    undecorate
    unmess
    window-is-ready-remover
  ]);
  
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
