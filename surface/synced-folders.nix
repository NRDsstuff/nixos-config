{ config, pkgs, ... }:

{
    services.syncthing.settings.folders = {
        "music" = {
            id = "kny7f-c7wwf";
            path = "/home/nrd/Music";
            devices = [ "jabe tefaxyn" "jabe spes" "jabe proseros" "jabe macbook" ];
        };
        "rift" = {
            id = "67ae6-9wxmy";
            path = "/home/nrd/Rift";
            devices = [ "jabe tefaxyn" "jabe spes" "jabe proseros" "jabe macbook" ];
        };
        "obsidian rondomix" = {
            id = "75ycc-ar6pj";
            path = "/home/nrd/Documents/obsidian/rondomix";
            devices = [ "jabe tefaxyn" "jabe spes" "jabe proseros" "jabe macbook" ];
        };
        "obsidian ixni" = {
            id = "dlebo-khhal";
            path = "/home/nrd/Documents/obsidian/ixni";
            devices = [ "jabe tefaxyn" "jabe spes" "ralue tefaxyn" "ralue proseros" "jabe proseros" "jabe macbook" ];
        };
        "anax kulup" = {
            id = "ejzvn-jtuie";
            path = "/home/nrd/anax kulup";
            devices = [ "jabe tefaxyn" "jabe spes" "ralue tefaxyn" "ralue proseros" "jabe proseros" "jabe macbook" ];
        };
        "obsidian school" = {
            id = "o2qk0-vgpjz";
            path = "/home/nrd/Documents/obsidian/school";
            devices = [ "jabe tefaxyn" "jabe spes" "jabe proseros" "jabe macbook" ];
        };
        "obsidian kulup.mp3" = {
            id = "bytx8-6vgq8";
            path = "/home/nrd/Documents/obsidian/kulup.mp3";
            devices = [ "jabe tefaxyn" "jabe spes" "ralue proseros" "ralue tefaxyn" "jabe proseros" "jabe macbook" ];
        };
    };
}
