{config, lib, pkgs, ...}:
with lib;
{
    # define user
    users.users.jeyphr = {
        isNormalUser = true;
        description = "Jeyphr";
        extraGroups = [ "networkmanager" "wheel" "admins" ];
        shell = pkgs.bash;
        initialPassword = "setmelater";
    };
    
    # Home manager
    # Here lies the stuff you may or may need here
    home-manager.users.bash = { pkgs, ... }: {

        systemd.user.sessionVariables = config.home-manager.users.meowster.home.sessionVariables;
        # never touch this
        home.stateVersion = "23.11";

        programs = { 
            git = {
                enable = true;
                userName = "Jeyphr";
            };
        };
    };
}