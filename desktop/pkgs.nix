{ config, pkgs, ... }:
let
    resourceDir = ../resources;
    n2311 = import <n2311> { config = { allowUnfree = true; };};
in
{
    # nix programs
    programs = {
        # steam = {
        #     enable = true;
        #     dedicatedServer.openFirewall = false; # sauce™ servers
        #     remotePlay.openFirewall = true; # remote play
        #     package = pkgs.steam.override {
        #         extraLibraries = pkgs: with pkgs; [
        #             glib-networking
        #         ];
        #         extraPkgs = pkgs: with pkgs; [
        #             bumblebee
        #             glxinfo
        #             openssl_1_1
        #             pango
        #             libthai
        #             harfbuzz
        #         ];
        #     };
        # };
    };

    # Set LibreWolf as the default browser
    xdg.mime.defaultApplications."text/html" = "librewolf.desktop";
    xdg.mime.defaultApplications."x-scheme-handler/http" = "librewolf.desktop";
    xdg.mime.defaultApplications."x-scheme-handler/https" = "librewolf.desktop";

    # figmaaaaaaaaaa
    system.activationScripts.figmaLauncher.text = ''
        ${pkgs.coreutils}/bin/mkdir /home/nrd/.local/share/applications || true
        ${pkgs.coreutils}/bin/rm -rf /home/nrd/.local/share/applications/select-for-figma.desktop
        ${pkgs.coreutils}/bin/cp ${resourceDir}/software/figma-linux/select-for-figma.desktop /home/nrd/.local/share/applications -r
    '';
    # cursor
    system.activationScripts.cursor.text = ''
        ${pkgs.coreutils}/bin/mkdir /home/nrd/.local/share/applications || true
        ${pkgs.coreutils}/bin/rm -rf /home/nrd/.local/share/applications/cursor.desktop
        ${pkgs.coreutils}/bin/cp ${resourceDir}/software/cursor/cursor.desktop /home/nrd/.local/share/applications -r
    '';
    # librewolf but prettier
    system.activationScripts.librewolf.text = ''
        ${pkgs.coreutils}/bin/mkdir /home/nrd/.local/share/applications || true
        ${pkgs.coreutils}/bin/rm -rf /home/nrd/.local/share/applications/librewolf.desktop
        ${pkgs.coreutils}/bin/cp ${resourceDir}/software/librewolf/librewolf.desktop /home/nrd/.local/share/applications -r
    '';

    # steam
    system.activationScripts.steam.text = ''
        ${pkgs.flatpak}/bin/flatpak install flathub com.valvesoftware.Steam
    '';
    
    # cuda
    # disabled because this doesn't do anything 2.7.2024
    # system.activationScripts.cuda.text = ''
    #     export CUDA_PATH=${pkgs.cudatoolkit}
    #     # export LD_LIBRARY_PATH=${pkgs.linuxPackages.nvidia_x11}/lib
    #     export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
    #     export EXTRA_CCFLAGS="-I/usr/include"
    # '';

    # system stuff
    # environment.systemPackages = with pkgs; [
    #     cudatoolkit
    # ];

    # nrd
    users.users.nrd.packages = (with pkgs; [
        # apps
        trigger-control
        libsForQt5.kdenlive
        adw-gtk3
        google-cursor
        prismlauncher
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
        unityhub
        # disabled due to broken behavior 2.7.2024
        # blender
        # natron
    ]) ++ (with n2311; [
        # emulators
        citra-nightly
        yuzu-mainline
        dolphin-emu
    ]);
  environment.systemPackages = [
  ];
}
