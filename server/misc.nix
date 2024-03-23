{ config, pkgs, ... }:

{
    # default shell will be bash
    users.defaultUserShell = pkgs.bash;

    # Use systemd to create the directory at startup
    systemd.tmpfiles.rules = [
        "d /home/shared 0777 root admins - -"
    ];

    # Use an activation script to set the permissions
    system.activationScripts.setPermissions = ''
        setfacl -m u::rwx,g::rwx,o::rwx /home/shared
        setfacl -d -m u::rwx,g::rwx,o::rwx /home/shared
    '';

    users.groups.admins = {
        name = "admins";
        gid = 6969;
    };
}