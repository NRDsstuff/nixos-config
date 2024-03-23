{ config, pkgs, ... }:
let
    unstable = import <nixos-unstable> { config = { allowUnfree = true; };};
in
{
    imports = [ <home-manager/nixos> ];

    # meow
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # idk what to do
    home-manager.useGlobalPkgs = true;
    
    # nix pkgs
    programs = {
        nix-ld.enable = true;
        zsh.enable = true;
    };
    
    # idk
    environment.systemPackages = with pkgs; [
        thefuck
        wget
        home-manager
        dconf2nix
        android-tools
        killall
        zulu8
        nodejs_20
        file
        acl
    ];
}
