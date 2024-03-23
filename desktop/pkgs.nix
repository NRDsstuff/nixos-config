{ config, pkgs, ... }:
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
            };
        };
    };

    # nrd
    users.users.nrd.packages = with pkgs; [
        # apps
        trigger-control
        immersed-vr
        blender
        libsForQt5.kdenlive
        davinci-resolve
        natron
        adw-gtk3
        google-cursor
        prismlauncher
        # emulators
        citra-nightly
        yuzu-mainline
        dolphin-emu
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
