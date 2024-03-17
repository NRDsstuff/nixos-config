# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/shell/extensions/pano" = {
      global-shortcut = [ "<Control><Super>v" ];
      history-length = 500;
      icon-pack = 0;
      paste-on-select = false;
      show-indicator = false;
      wiggle-indicator = true;
      window-position = mkUint32 1;
    };

  };
}
