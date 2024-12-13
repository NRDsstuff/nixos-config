{...}:
{
    home-manager.users.nrd = { pkgs, ... }: {
        # yes
        dconf.settings = {
            
            # keybinds
            "org/gnome/desktop/wm/keybindings" = {
                activate-window-menu = [ "<Alt>F3" ];
                begin-resize = [ "<Control><Super>c" ];
                minimize = [ "<Super>Page_Down" ];
                move-to-workspace-1 = [];
                move-to-workspace-last = [];
                move-to-workspace-left = [ "<Shift><Control><Super>Left" ];
                move-to-workspace-right = [ "<Shift><Control><Super>Right" ];
                switch-to-workspace-left = [ "<Control><Super>Left" ];
                switch-to-workspace-right = [ "<Control><Super>Right" ];
                toggle-fullscreen = [ "<Super>F11" ];
                toggle-maximized = [ "<Super>w" ];
            };

            # gnome settings
            "org/gnome/desktop/interface" = {
                color-schene = "prefer-dark";
                clock-show-seconds = false;
                clock-format = "24h";
                clock-show-date = true;
                enable-hot-corners = false;
                gtk-enable-primary-paste = false; # genuinely one of the most annoying features ever
                # could break the setup if files not present, put icons from resources to /usr/share (i don't know how to do it automatically)
                gtk-theme = "adw-gtk3-dark";
                cursor-theme = "GoogleDot-Black";
                icon-theme = "Adwaita-hacks";
            };

            "org/gnome/desktop/peripherals/mouse" = {
                accel-profile = "flat"; # why is there mouse accel in the first place
            };

            # caffeine
            "org/gnome/shell/extensions/caffeine" = {
                duration-timer = 2;
                enable-fullscreen = false;
                indicator-position-max = 1;
                prefs-default-height = 1032;
                prefs-default-width = 1904;
                restore-state = true;
                show-indicator = "never";
                toggle-state = true;
                user-enabled = true;
            };

            # clipboard history
            "org/gnome/shell/extensions/clipboard-history" = {
                toggle-menu = [ "<Control><Super>v" ];
                window-width-percentage = 25;
            };

            # blur my shell
            "org/gnome/shell/extensions/blur-my-shell" = {
                settings-version = 2;
                sigma = 80;
            };

            "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
                style-dialogs = 2;
                blur = true;
                sigma = 80;
                brightness = 0.4;
            };

            "org/gnome/shell/extensions/blur-my-shell/applications" = {
                blur = false;
                blur-on-overview = false;
                enable-all = false;
            };

            "org/gnome/shell/extensions/blur-my-shell/panel" = {
	            blur=true;
                brightness = 0.4;
                force-light-text = false;
                pipeline = "pipeline_default";
                sigma=80;
                static-blur = true;
            };

            # tiling yay
            "org/gnome/shell/extensions/forge" = {
                css-last-update = 37;
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

            # alphabetical app grid
            "org/gnome/shell/extensions/alphabetical-app-grid" = {
                folder-order-position = "end";
            };

            # app hider
            "org/gnome/shell/extensions/app-hider" = {
                hidden-apps = [ "cups.desktop" "chromium-browser.desktop" "nixos-manual.desktop" "nvidia-settings.desktop" "yelp.desktop" "xterm.desktop" "simple-scan.desktop" "Steam Linux Runtime 3.0 (sniper).desktop" "Proton Experimental.desktop" ];
            };

            "org/gnome/shell/extensions/app-hider/hidden-apps" = {
                hidden-apps = [ "cups.desktop" "chromium-browser.desktop" "nixos-manual.desktop" "nvidia-settings.desktop" "yelp.desktop" "xterm.desktop" "simple-scan.desktop" "Steam Linux Runtime 3.0 (sniper).desktop" "Proton Experimental.desktop" ];
            };

            # mpris
            "org/gnome/shell/extensions/mpris-label" = {
                auto-switch-to-most-recent = true;
                button-placeholder = "";
                divider-string = " - ";
                extension-place = "left";
                first-field = "xesam:title";
                icon-padding = 5;
                label-filtered-list = "remaster,remix,featuring,live";
                last-field = "xesam:artist";
                left-padding = 5;
                right-padding = 4;
                second-field = "";
            };

            # pano
            "org/gnome/shell/extensions/pano" = {
                global-shortcut = [ "<Control><Super>v" ];
                history-length = 100;
                icon-pack = 0;
                paste-on-select = false;
                show-indicator = false;
                wiggle-indicator = true;
                # window-position = 1; # doesn't do shit (but it's supposed to)
            };

            # tray icons
            "org/gnome/shell/extensions/trayIconsReloaded" = {
                icons-limit = 1;
            };
        };
    };
}