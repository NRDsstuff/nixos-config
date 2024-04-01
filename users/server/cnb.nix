# The user called cat

{config, pkgs, ...}:

{
    # cnb's user configuraton
    # simpler :3 
    users.users.cat = {
        isNormalUser = true;
        description = "cat";
        extraGroups = ["networkmanager" "wheel" "admins"];
        shell = pkgs.zsh;
        initialPassword = "setmelater";
    };

    home-manager.users.cat = { pkgs, ... }: {

        systemd.user.sessionVariables = config.home-manager.users.cat.home.sessionVariables;
        
        # never touch this
        home.stateVersion = "23.11";
        
        programs = { 
            git = {
                enable = true;
                userName = "raluvy95";
                # no email for you lol
            };

            zsh = {
                enable = true;
                enableCompletion = true;
                enableAutosuggestions = true;
                syntaxHighlighting.enable = true;

                oh-my-zsh = {
                    enable = true;
                    plugins = [ "git" "thefuck" ];
                    theme = "robbyrussell";
                };

                # The default zsh for NixOS doesn't have this kind of functionality
                # So I had to add arrow-up and arrow-down for this
                initExtra = ''
                bindkey "''${key[Up]}" up-line-or-search
                bindkey "''${key[Down]}" down-line-or-search
                '';
            };
        };
    };
}