{ config, pkgs, ... }:

{
  # meow
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # flatpak 
  services.flatpak.enable = true;
  
  # nix pkgs
  environment.systemPackages = (with pkgs; [
    # apps
    tuba
    citra-nightly
    wget
    telegram-desktop
    steam
    prismlauncher
    natron
    davinci-resolve
    trigger-control
    gnome.gnome-tweaks
    libsForQt5.kdenlive
    gnome.gnome-software
    nodejs
    adw-gtk3
    home-manager
    firefox
    git
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
    xterm
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
}
