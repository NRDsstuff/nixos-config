{ config, pkgs, ... }:
let
    resourceDir = ../resources;
in
{
    # nix programs
    programs = {
        steam = {
            enable = true;
            dedicatedServer.openFirewall = false; # sauce™ servers
            remotePlay.openFirewall = true; # remote play
            package = pkgs.steam.override {
                extraLibraries = pkgs: with pkgs; [
                    glib-networking
                ];
                extraPkgs = pkgs: with pkgs; [
                    bumblebee
                    glxinfo
                    openssl_1_1
                ];
            };
        };
    };

    # figmaaaaaaaaaa
    system.activationScripts.figmaLauncher.text = ''
        ${pkgs.coreutils}/bin/mkdir /usr/share/applications
        ${pkgs.coreutils}/bin/rm -rf /usr/share/applications/figma-linux.desktop
        ${pkgs.coreutils}/bin/cp ${resourceDir}/software/figma-linux/figma-linux.desktop /usr/share/applications -r
    '';
    
    # cuda
    system.activationScripts.cuda.text = ''
        export CUDA_PATH=${pkgs.cudatoolkit}
        # export LD_LIBRARY_PATH=${pkgs.linuxPackages.nvidia_x11}/lib
        export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
        export EXTRA_CCFLAGS="-I/usr/include"
    '';

    # system stuff
    environment.systemPackages = with pkgs; [
        cudatoolkit
    ];

    # nrd
    users.users.nrd.packages = with pkgs; [
        # apps
        trigger-control
        immersed-vr
        blender
        libsForQt5.kdenlive
        natron
        adw-gtk3
        google-cursor
        prismlauncher
        # emulators
        citra-nightly
        yuzu-mainline
        dolphin-emu
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
    ];

    # nrd's bro
    users.users.gutek.packages = (with pkgs; [
        # ŋ
        adw-gtk3
        google-cursor
        citra-nightly
        yuzu-mainline
        dolphin-emu
        trigger-control
        prismlauncher
        zulu8
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
}
