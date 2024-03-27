# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [ "<Alt>F3" ];
      begin-resize = [ "<Control><Super>c" ];
      maximize = [];
      minimize = [ "<Super>Page_Down" ];
      move-to-workspace-1 = [];
      move-to-workspace-last = [];
      move-to-workspace-left = [ "<Shift><Control><Super>Left" ];
      move-to-workspace-right = [ "<Shift><Control><Super>Right" ];
      switch-to-workspace-1 = [];
      switch-to-workspace-last = [];
      switch-to-workspace-left = [ "<Control><Super>Left" ];
      switch-to-workspace-right = [ "<Control><Super>Right" ];
      toggle-fullscreen = [ "<Super>F11" ];
      toggle-maximized = [ "<Super>w" ];
    };

  };
}
