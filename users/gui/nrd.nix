{config, lib, pkgs, modulesPath, ...}:
with lib;
let
    resourceDir = ../../resources;
    homeConfig = ".config/";
    fastfetch = import ./nrd/config/fastfetch.nix;
in
{
    imports = [
        ./nrd/dconf.nix
    ];

    "${homeConfig}fastfetch/config.jsonc".text = builtins.toJSON fastfetch;

    # define user
    users.users.nrd = {
        isNormalUser = true;
        description = "NRD";
        extraGroups = [ "networkmanager" "wheel" "docker" ];
    };

    # make forge STFU
    systemd.services.forgeFuckupFix = {
        description = "Fix up forge's fuckup";
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
            ExecStart = ''
                ${pkgs.coreutils}/bin/rm -rf /home/nrd/undefined.bak
                ${pkgs.coreutils}/bin/rm -rf /home/nrd/.config/forge
            '';
            RemainAfterExit = true;
        };
    };

    # forge brain damage fix
    # i have no idea why it breaks like this 
    system.activationScripts.idfk.text = ''
        ${pkgs.coreutils}/bin/rm -rf /home/nrd/undefined.bak
        ${pkgs.coreutils}/bin/rm -rf /home/nrd/.config/forge
    '';

    system.activationScripts.p10kfile.text = ''
        ${pkgs.coreutils}/bin/rm -rf /home/nrd/.p10k.zsh
        ${pkgs.coreutils}/bin/cp "${resourceDir}/config files/.p10k.zsh" /home/nrd
    '';

    # zsh
    users.defaultUserShell = pkgs.zsh;

    # set up ~
    system.activationScripts.extra.text = ''
        if [ -d "/extra" ]; then
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Videos && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Videos /home/nrd/Videos
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/3D && ${pkgs.coreutils}/bin/ln -s /extra/nrd/3D /home/nrd/3D
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Pictures && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Pictures /home/nrd/Pictures
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Templates && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Templates /home/nrd/Templates
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Music && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Music /home/nrd/Music
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Random && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Random /home/nrd/Random
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Coding && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Coding /home/nrd/Coding
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Nixos && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Nixos /home/nrd/Nixos
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Memes && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Memes /home/nrd/Memes
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Documents && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Documents /home/nrd/Documents
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Downloads && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Downloads /home/nrd/Downloads
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Doom && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Doom /home/nrd/Doom
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Games && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Games /home/nrd/Games
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Fonts && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Fonts /home/nrd/Fonts
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Android && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Android /home/nrd/Android
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Minecraft && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Minecraft /home/nrd/Minecraft
        else
            echo "/extra does not exist"
        fi
    '';

    # furryfox
    system.activationScripts.firefoxProfile.text = ''
        if [ -d "/extra" ]; then
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/.mozilla && ${pkgs.coreutils}/bin/ln -s /extra/nrd/.mozilla /home/nrd/.mozilla
        else
            if [ -d "/home/nrd/.mozilla" ]; then
                echo "mozilla folder already exists. remove it manually if you want to replace it."
            else
                ${pkgs.coreutils}/bin/mkdir "/home/nrd/.mozilla/"
                ${pkgs.coreutils}/bin/cp "${resourceDir}/firefox/*" "/home/nrd/.mozilla/"
            fi
        fi
    '';
    "firefox-gnome-theme" = {
        target = ".mozilla/firefox/homeconfig/chrome/firefox-gnome-theme";
        source = (fetchTarball "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/master.tar.gz");
    };

    # install custom icon packs, cursors and wallpapers
    system.activationScripts.themingResourcesNRD.text = ''
        ${pkgs.coreutils}/bin/rm -rf /home/nrd/.icons
        ${pkgs.coreutils}/bin/rm -rf /home/nrd/.themes
        ${pkgs.coreutils}/bin/mkdir /home/nrd/.icons
        ${pkgs.coreutils}/bin/mkdir /home/nrd/.themes
        ${pkgs.coreutils}/bin/cp ${resourceDir}/icons/* /home/nrd/.icons -r
        ${pkgs.coreutils}/bin/cp ${resourceDir}/themes/* /home/nrd/.themes -r
        ${pkgs.coreutils}/bin/chown -R nrd /home/nrd/.icons # ugh
        ${pkgs.coreutils}/bin/chown -R nrd /home/nrd/.themes # ugh
        ${pkgs.coreutils}/bin/chmod -R 777 /home/nrd/.icons # ugh
        ${pkgs.coreutils}/bin/chmod -R 777 /home/nrd/.themes # ugh
    '';
    
    # Home manager
    # Here lies the stuff you may or may need here
    home-manager.users.nrd = { pkgs, ... }: {

        systemd.user.sessionVariables = config.home-manager.users.nrd.home.sessionVariables;
        # never touch this
        home.stateVersion = "23.11";

        programs = { 

             firefox = {
                enable = true;
                profiles.homeconfig = {
                    search.privateDefault = "DuckDuckGo";
                    name = "Default managed by home-manager";
                    settings = {
                        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";

                        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                        "browser.tabs.drawInTitlebar" = true;
                        "svg.context-properties.content.enabled" = true;
                        "mozilla.widget.use-argb-visuals" = true;

                        "gnomeTheme.hideSingleTab" = true;
                        "gnomeTheme.hideWebrtcIndicator" = true;
                    };
                    userChrome = ''
                        @import "firefox-gnome-theme/userChrome.css";
                        @import "firefox-gnome-theme/theme/colors/dark.css";
                    '';
                };
            };
            
            git = {
                enable = true;
                userName = "nrdsstuff";
                userEmail = "nrdfoss@gmail.com";
            };

            zsh = {
                enable = true;
                enableCompletion = true;
                enableAutosuggestions = true;
                syntaxHighlighting.enable = true;

                oh-my-zsh = {
                    enable = true;
                    plugins = [ "git" "thefuck" ];
                    # theme = "darkblood";
                };

                shellAliases = {
                    nixos-update = "sudo nixos-rebuild switch";
                    nixos-test = "sudo nixos-rebuild test";
                };

                # powerlevel10k setup
                # After updating your nixos with this setup, you will have p10k configuration upon new shell session
                # Of course I included ~/.p10k.zsh when the file exists
                plugins = [
                    {
                        name = "powerlevel10k";
                        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
                        file = "powerlevel10k.zsh-theme";
                    }
                ];

                # The default zsh for NixOS doesn't have this kind of functionality
                # So I had to add arrow-up and arrow-down for this
                # tf 
                initExtra = ''
                bindkey "''${key[Up]}" up-line-or-search
                bindkey "''${key[Down]}" down-line-or-search

                test -e ~/.p10k.zsh && source ~/.p10k.zsh
                '';
            };
        };
    };
}
