# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/shell/extensions/forge" = {
      css-last-update = mkUint32 37;
      dnd-center-layout = "swap";
      focus-border-toggle = false;
      move-pointer-focus-enabled = false;
      preview-hint-enabled = false;
      quick-settings-enabled = false;
      stacked-tiling-mode-enabled = false;
      tabbed-tiling-mode-enabled = false;
      tiling-mode-enabled = true;
    };

    "org/gnome/shell/extensions/forge/keybindings" = {
      con-split-horizontal = [];
      con-split-layout-toggle = [];
      con-split-vertical = [];
      con-stacked-layout-toggle = [];
      con-tabbed-layout-toggle = [];
      con-tabbed-showtab-decoration-toggle = [];
      focus-border-toggle = [];
      prefs-open = [];
      prefs-tiling-toggle = [];
      window-focus-down = [];
      window-focus-left = [];
      window-focus-right = [];
      window-focus-up = [];
      window-gap-size-decrease = [];
      window-gap-size-increase = [];
      window-move-down = [];
      window-move-left = [];
      window-move-right = [];
      window-move-up = [];
      window-resize-bottom-decrease = [];
      window-resize-bottom-increase = [];
      window-resize-left-decrease = [];
      window-resize-left-increase = [];
      window-resize-right-decrease = [];
      window-resize-right-increase = [];
      window-resize-top-decrease = [];
      window-resize-top-increase = [];
      window-snap-center = [];
      window-snap-one-third-left = [];
      window-snap-one-third-right = [];
      window-snap-two-third-left = [];
      window-snap-two-third-right = [];
      window-swap-down = [];
      window-swap-last-active = [];
      window-swap-left = [];
      window-swap-right = [];
      window-swap-up = [];
      window-toggle-always-float = [];
      window-toggle-float = [ "<Super>f" "<Super>f" ];
      workspace-active-tile-toggle = [];
    };

  };
}
