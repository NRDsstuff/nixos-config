{config, lib, pkgs, ...}:
with lib;
{
    # define user
    users.users.ecodz = {
        isNormalUser = true;
        description = "E-Codz";
        extraGroups = [ "networkmanager" "wheel" "admins" ];
        shell = pkgs.bash;
        initialPassword = "setmelater";
    };
    
    # Home manager
    # Here lies the stuff you may or may need here
    home-manager.users.bash = { pkgs, ... }: {

        systemd.user.sessionVariables = config.home-manager.users.ecodz.home.sessionVariables;
        # never touch this
        home.stateVersion = "23.11";

        programs = { 
            git = {
                enable = true;
                userName = "ecodz";
            };
        };
    };
}