/*
* Copyright (c) 2018 Alexis Fuentes (http://github.com/alexisfuentes)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Alexis Fuentes <alefue21@gmail.com>
*/

public class Vcomic.Window : Gtk.ApplicationWindow {

    public Gtk.AccelGroup accel_group { get; construct; }

    public weak Vcomic.Application app { get; construct; }

    // Elementos publicos
    public Vcomic.Layouts.HeaderBar titlebar;
    public Vcomic.Services.ActionManager action_manager;

    public Window (Vcomic.Application app_comic) {
        Object (
            application: app_comic,
            app: app_comic,
            icon_name: "com.github.alexisfuentes.vcomic"
        );
    }

    construct {
        accel_group = new Gtk.AccelGroup();
        add_accel_group(accel_group);
        titlebar = new Vcomic.Layouts.HeaderBar(this);
        action_manager = new Vcomic.Services.ActionManager(app, this);

        // Crear la interfaz
        build_ui();

        // move(settings.pos_x, settings.pos_y);
        move(100, 100);
        // resize(settings.window_with, settings.window_height);
        resize(600, 600);

        show_app();
    }

    public Vcomic.Window get_instance () {
        return this;
    }

    private void build_ui() {
        // Gtk.Settings.get_default().gtk_application_prefer_dark_theme = settings.dark_theme;

        var css_provider = new Gtk.CssProvider();
        // Cargar el archivo css

        set_titlebar(titlebar);
        set_border_width(0);

        /*delete_event.connect((e) => {
            return before_destroy();
        });*/

        // add(main);
    }

    public void show_app() {
        show_all();
        show();
        present();
    }
}