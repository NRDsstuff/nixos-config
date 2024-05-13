{ config, pkgs, modulesPath, ... }:
let
    unstable = import <nixos-unstable> { config = { allowUnfree = true; };};
    resourceDir = ./../resources;
in
{
    imports = [ <home-manager/nixos> ];

    # meow
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    # pooprietary
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.nvidia.acceptLicense = true;

    # flatpak 
    services.flatpak.enable = true;
    system.activationScripts.flatrepos.text = ''
        ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
        ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists appcenter https://flatpak.elementary.io/repo.flatpakrepo
    '';
    system.activationScripts.flatpakThemes.text = ''
        ${pkgs.flatpak}/bin/flatpak override --filesystem=$HOME/.themes
        ${pkgs.flatpak}/bin/flatpak override --filesystem=$HOME/.icons
        ${pkgs.flatpak}/bin/flatpak override --env=GTK_THEME=adw-gtk3-dark 
        ${pkgs.flatpak}/bin/flatpak override --env=ICON_THEME=Adwaita-hacks
    '';

    # idk what to do
    home-manager.useGlobalPkgs = true;
    
    # nix pkgs
    programs = {
        nix-ld.enable = true;
        zsh.enable = true;
        firefox = {
            enable = true;
            preferences = {
                "widget.use-xdg-desktop-portal.file-picker" = 1;
            };
            nativeMessagingHosts.packages = [ unstable.firefoxpwa ];
        };
    };
    
    # idk
    environment.systemPackages = (with pkgs; [
        ffmpeg
        megatools
        unstable.firefoxpwa
        thefuck
        wget
        home-manager
        dconf2nix
        android-tools
        killall
        gparted
        appimage-run
    ]) ++ (with pkgs.gnome; [
        gnome-tweaks
        gnome-software
        dconf-editor
    ]);

    # nrd
    users.users.nrd.packages = (with pkgs; [
        # apps
        unzip
        tuba
        nodejs
        lollypop
        obsidian
        vscode
        zulu8
        libreoffice
        inkscape
    ]) ++ (with pkgs.gnome; [
        # gnome packages
        quadrapassel
    ]) ++ (with pkgs.gnomeExtensions; [
        # gnome extensions
        just-perfection
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
    ]) ++ (with unstable; [
        # unstable channel
        bun
        gnomeExtensions.gemini-ai
    ]);
    
    # SHUT THE FUCK UP
    nixpkgs.config.permittedInsecurePackages = [
        "electron-25.9.0" 
        "openssl-1.1.1w"
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

    # install custom icon packs, cursors and wallpapers
    system.activationScripts.themingResources.text = ''
        ${pkgs.coreutils}/bin/rm -rf /usr/share/icons
        ${pkgs.coreutils}/bin/rm -rf /usr/share/backgrounds
        ${pkgs.coreutils}/bin/rm -rf /usr/share/themes
        ${pkgs.coreutils}/bin/mkdir -p /usr # we can never be 100% sure
        ${pkgs.coreutils}/bin/mkdir -p /usr/share
        ${pkgs.coreutils}/bin/cp ${resourceDir}/icons /usr/share/icons -r
        ${pkgs.coreutils}/bin/cp ${resourceDir}/backgrounds /usr/share/backgrounds -r
        ${pkgs.coreutils}/bin/cp ${resourceDir}/themes /usr/share/themes -r
        ${pkgs.coreutils}/bin/chmod 777 -R /usr/share # ugh
    '';
}
