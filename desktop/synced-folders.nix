{ config, pkgs, ... }:

{
    services.syncthing.settings.folders = {
        "music" = {
            id = "kny7f-c7wwf";
            path = "/home/nrd/Music";
            devices = [ "jabe tefaxyn" "jabe mi11t" "jabe spes" "jabe tablet" "jabe macbook" ];
        };
        "rift" = {
            id = "67ae6-9wxmy";
            path = "/home/nrd/Rift";
            devices = [ "jabe tefaxyn" "jabe mi11t" "jabe spes" "jabe tablet" "jabe macbook" ];
        };
        "obsidian rondomix" = {
            id = "75ycc-ar6pj";
            path = "/home/nrd/Documents/obsidian/rondomix";
            devices = [ "jabe tefaxyn" "jabe mi11t" "jabe spes" "jabe tablet" ];
        };
        "obsidian ixni" = {
            id = "dlebo-khhal";
            path = "/home/nrd/Documents/obsidian/ixni";
            devices = [ "jabe tefaxyn" "jabe mi11t" "jabe spes" "ralue tefaxyn" "ralue proseros" "jabe tablet" "jabe macbook" ];
        };
        "anax kulup" = {
            id = "ejzvn-jtuie";
            path = "/home/nrd/anax kulup";
            devices = [ "jabe tefaxyn" "jabe mi11t" "jabe spes" "ralue tefaxyn" "ralue proseros" "jabe tablet" "jabe macbook" ];
        };
        "obsidian school" = {
            id = "o2qk0-vgpjz";
            path = "/home/nrd/Documents/obsidian/school";
            devices = [ "jabe tefaxyn" "jabe mi11t" "jabe spes" "jabe tablet" "jabe macbook" ];
        };
        "obsidian kulup.mp3" = {
            id = "bytx8-6vgq8";
            path = "/home/nrd/Documents/obsidian/kulup.mp3";
            devices = [ "jabe tefaxyn" "jabe mi11t" "jabe spes" "ralue proseros" "ralue tefaxyn" "jabe tablet" "jabe macbook" ];
        };
        "books" = {
            id = "6dovv-1tpo9";
            path = "/home/nrd/Documents/books";
            devices = [ "jabe tefaxyn" "jabe mi11t" "jabe quest" ];
        };
        "obsidian project wyfoma" = {
            id = "xp4uk-a3eyb";
            path = "/home/nrd/Documents/obsidian/wyfoma";
            devices = [ "jabe tefaxyn" "jabe quest" "jabe macbook" ];
        };
    };
}
