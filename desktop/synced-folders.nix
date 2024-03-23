{ config, pkgs, ... }:

{
    services.syncthing.settings.folders = {
        "music" = {
            id = "kny7f-c7wwf";
            path = "/home/nrd/Music";
            devices = [ "jabe tefaxyn" "jabe spes" "jabe tablet" ];
        };
        "rift" = {
            id = "67ae6-9wxmy";
            path = "/home/nrd/Rift";
            devices = [ "jabe tefaxyn" "jabe spes" "jabe tablet" ];
        };
        "obsidian rondomix" = {
            id = "75ycc-ar6pj";
            path = "/home/nrd/Documents/obsidian/rondomix";
            devices = [ "jabe tefaxyn" "jabe spes" "jabe tablet" ];
        };
        "obsidian ixni" = {
            id = "dlebo-khhal";
            path = "/home/nrd/Documents/obsidian/ixni";
            devices = [ "jabe tefaxyn" "jabe spes" "ralue tefaxyn" "ralue proseros" "jabe tablet" ];
        };
        "anax kulup" = {
            id = "ejzvn-jtuie";
            path = "/home/nrd/anax kulup";
            devices = [ "jabe tefaxyn" "jabe spes" "ralue tefaxyn" "ralue proseros" "jabe tablet" ];
        };
        "obsidian school" = {
            id = "o2qk0-vgpjz";
            path = "/home/nrd/Documents/obsidian/school";
            devices = [ "jabe tefaxyn" "jabe spes" "jabe tablet" ];
        };
        "obsidian kulup.mp3" = {
            id = "bytx8-6vgq8";
            path = "/home/nrd/Documents/obsidian/kulup.mp3";
            devices = [ "jabe tefaxyn" "jabe spes" "ralue proseros" "ralue tefaxyn" "jabe tablet" ];
        };
    };
}
