{config, lib, pkgs, ...}:
with lib;
{
    # define user
    users.users.lenni = {
        isNormalUser = true;
        description = "Lenni";
        extraGroups = [ "networkmanager" "wheel" "admins" ];
        # shell = pkgs.bash;
        initialPassword = "setmelater";
    };
    
    # Home manager
    # Here lies the stuff you may or may need here
    home-manager.users.lenni = { pkgs, ... }: {

        systemd.user.sessionVariables = config.home-manager.users.lenni.home.sessionVariables;
        # never touch this
        home.stateVersion = "23.11";

        programs = { 
            git = {
                enable = true;
                userName = "Lenni-builder";
            };
        };
    };
}