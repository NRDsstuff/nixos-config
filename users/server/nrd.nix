{config, lib, pkgs, ...}:
with lib;
{
    # define user
    users.users.nrd = {
        isNormalUser = true;
        description = "NRD";
        extraGroups = [ "networkmanager" "wheel" "admins" ];
        shell = pkgs.zsh;
        initialPassword = "setmelater";
    };
    
    # Home manager
    # Here lies the stuff you may or may need here
    home-manager.users.nrd = { pkgs, ... }: {

        systemd.user.sessionVariables = config.home-manager.users.nrd.home.sessionVariables;
        # never touch this
        home.stateVersion = "23.11";

        programs = { 
            git = {
                enable = true;
                userName = "NRDsstuff";
            };

            zsh = {
                enable = true;
                enableCompletion = true;
                enableAutosuggestions = true;
                syntaxHighlighting.enable = true;

                oh-my-zsh = {
                    enable = true;
                    plugins = [ "git" "thefuck" ];
                    theme = "darkblood";
                };

                # The default zsh for NixOS doesn't have this kind of functionality
                # So I had to add arrow-up and arrow-down for this
                # tf 
                initExtra = ''
                    bindkey "''${key[Up]}" up-line-or-search
                    bindkey "''${key[Down]}" down-line-or-search
                '';
            };
        };
    };
}
