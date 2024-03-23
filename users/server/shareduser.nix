{config, lib, pkgs, ...}:
with lib;
{
    # define user
    users.users.shareduser = {
        isNormalUser = true;
        description = "Shared user";
        extraGroups = [ "networkmanager" "admins" ];
        shell = pkgs.bash;
        password = " ";
    };
}