import Adw from 'gi://Adw';
import GObject from 'gi://GObject';
import { gettext as _ } from 'resource:///org/gnome/Shell/Extensions/js/extensions/prefs.js';
import { connections } from '../../utils/connections.js';
import { settings } from '../../utils/settings.js';
import { CustomEffectRow, CustomEffectRowClass, } from '../widgets/customeffect_row.js';
import { uri } from '../../utils/io.js';
export const Custom = GObject.registerClass({
    Template: uri(import.meta.url, 'custom.ui'),
    GTypeName: 'PrefsCustom',
    InternalChildren: ['custom_group'],
}, class extends Adw.PreferencesPage {
    constructor() {
        super();
        this._settings_cfg = settings().custom_rounded_corner_settings;
        for (const title in this._settings_cfg) {
            this.add_window(undefined, title);
        }
    }
    add_window(_, title) {
        const callbacks = {
            on_delete: row => this.delete_row(row),
            on_title_changed: (row, old_title, new_title) => this.change_title(row, old_title, new_title),
        };
        const row = new CustomEffectRow(callbacks);
        if (title) {
            this.setup_row(row, title);
        }
        row.set_subtitle(title ?? '');
        this._custom_group.add(row);
    }
    delete_row(row) {
        delete this._settings_cfg[row.subtitle];
        settings().custom_rounded_corner_settings = this._settings_cfg;
        this.disconnect_row(row);
        this._custom_group.remove(row);
    }
    change_title(row, old_title, new_title) {
        if (this._settings_cfg[new_title] !== undefined) {
            const win = this.root;
            win.add_toast(new Adw.Toast({
                title: _(`Can't add ${new_title} to the list, because it already there`),
            }));
            return false;
        }
        if (old_title === '') {
            this._settings_cfg[new_title] =
                settings().global_rounded_corner_settings;
        }
        else {
            const cfg = this._settings_cfg[old_title];
            delete this._settings_cfg[old_title];
            this._settings_cfg[new_title] = cfg;
            this.disconnect_row(row);
        }
        this.setup_row(row, new_title);
        settings().custom_rounded_corner_settings = this._settings_cfg;
        return true;
    }
    setup_row(row, title) {
        const c = connections.get();
        if (!(row instanceof CustomEffectRowClass)) {
            return;
        }
        const r = row;
        c.connect(r, 'notify::subtitle', (row) => {
            row.check_state();
        });
        r.enabled_row.set_active(this._settings_cfg[title].enabled);
        c.connect(r.enabled_row, 'notify::active', (row) => {
            r.check_state();
            this._settings_cfg[title].enabled = row.get_active();
            settings().custom_rounded_corner_settings = this._settings_cfg;
        });
        r.corner_radius.set_value(this._settings_cfg[title].border_radius);
        c.connect(r.corner_radius, 'value-changed', (adj) => {
            this._settings_cfg[title].border_radius = adj.get_value();
            settings().custom_rounded_corner_settings =
                this._settings_cfg;
        });
        r.corner_smoothing.set_value(this._settings_cfg[title].smoothing);
        c.connect(r.corner_smoothing, 'value-changed', (adj) => {
            this._settings_cfg[title].smoothing = adj.get_value();
            settings().custom_rounded_corner_settings =
                this._settings_cfg;
        });
        r.keep_for_maximized.set_active(this._settings_cfg[title].keep_rounded_corners.maximized);
        c.connect(r.keep_for_maximized, 'notify::active', (row) => {
            this._settings_cfg[title].keep_rounded_corners.maximized =
                row.get_active();
            settings().custom_rounded_corner_settings =
                this._settings_cfg;
        });
        r.keep_for_fullscreen.set_active(this._settings_cfg[title].keep_rounded_corners.fullscreen);
        c.connect(r.keep_for_fullscreen, 'notify::active', (row) => {
            this._settings_cfg[title].keep_rounded_corners.fullscreen =
                row.get_active();
            settings().custom_rounded_corner_settings =
                this._settings_cfg;
        });
        r.paddings.paddingTop = this._settings_cfg[title].padding.top;
        c.connect(r.paddings, 'notify::padding-top', (row) => {
            this._settings_cfg[title].padding.top = row.paddingTop;
            settings().custom_rounded_corner_settings =
                this._settings_cfg;
        });
        r.paddings.paddingBottom = this._settings_cfg[title].padding.bottom;
        c.connect(r.paddings, 'notify::padding-bottom', (row) => {
            this._settings_cfg[title].padding.bottom =
                row.paddingBottom;
            settings().custom_rounded_corner_settings =
                this._settings_cfg;
        });
        r.paddings.paddingStart = this._settings_cfg[title].padding.left;
        c.connect(r.paddings, 'notify::padding-start', (row) => {
            this._settings_cfg[title].padding.left = row.paddingStart;
            settings().custom_rounded_corner_settings =
                this._settings_cfg;
        });
        r.paddings.paddingEnd = this._settings_cfg[title].padding.right;
        c.connect(r.paddings, 'notify::padding-end', (row) => {
            this._settings_cfg[title].padding.right = row.paddingEnd;
            settings().custom_rounded_corner_settings =
                this._settings_cfg;
        });
    }
    disconnect_row(row) {
        const c = connections.get();
        if (!(row instanceof CustomEffectRowClass)) {
            return;
        }
        const r = row;
        c.disconnect_all(r);
        c.disconnect_all(r.enabled_row);
        c.disconnect_all(r.corner_radius);
        c.disconnect_all(r.corner_smoothing);
        c.disconnect_all(r.keep_for_maximized);
        c.disconnect_all(r.keep_for_fullscreen);
        c.disconnect_all(r.paddings);
    }
});
