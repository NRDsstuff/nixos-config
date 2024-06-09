{ config, pkgs, ... }:

{
    # import shit lol
    imports = [
        # universal
        ./universal/autoupdate.nix # yes, autoupdate for the server. what could possibly go wrong?
        ./universal/locale.nix
        ./universal/syncthing.nix
        ./universal/misc.nix
        ./universal/flatpak-fix.nix

        # replace desktop with device
        ./desktop/import.nix
    ];

    # ONLY BREAK GLASS IN CASE OF FIRE
    nixpkgs.config.allowBroken = true;
    
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?
}
