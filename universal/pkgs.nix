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
  system.activationScripts.flathub.text = "${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo";
  
  # nix pkgs
  programs = {
    nix-ld.enable = true;
    zsh.enable = true;
    firefox = {
      enable = true;
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
  };
  
  # ææææææææ
  environment.systemPackages = (with pkgs; [
    # apps
    thefuck
    bun
    tuba
    wget
    prismlauncher
    nodejs
    home-manager
    chromium
    lollypop
    obsidian
    killall
    android-tools
    vscode
    zulu8
    libreoffice
    dconf2nix
    telegram-desktop
    inkscape
  ]) ++ (with pkgs.gnome; [
    # gnome packages
    gnome-tweaks
    gnome-software
    dconf-editor
  ]) ++ (with pkgs.gnomeExtensions; [
    # gnome extensions
    extension-list
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
    window-is-ready-remover
  ]);
  
  # SHUT THE FUCK UP
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0" 
  ];
  
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
