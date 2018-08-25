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

public class Vcomic.Layouts.HeaderBar : Gtk.HeaderBar {
    public weak Vcomic.Window window { get; construct; }

    public HeaderBar (Vcomic.Window main_window){
        Object (
            window: main_window
        );

        set_title("Vcomic");
        set_show_close_button(true);

        build_ui();
    }

    private void build_ui() {
        // Crear los botones que contendra el headerbar
        var btnconfig = new Gtk.Button();
        btnconfig.set_image(new Gtk.Image.from_icon_name("open-menu-symbolic",
            Gtk.IconSize.LARGE_TOOLBAR
        ));
        var btnopen = new Gtk.Button();
        btnopen.set_label("Abrir");

        var btnfullscreen = new Gtk.Button();
        btnfullscreen.set_label("full");

        var btnextpage = new Gtk.Button();
        btnextpage.set_label("Next");

        var etpage = new Gtk.Entry();

        var btnprevious = new Gtk.Button();
        btnprevious.set_label("Previous");

        // Crear el menu que ira dentro del popover
        var menu = new GLib.Menu();
        menu.append(
            "Configurar", 
            Vcomic.Services.ActionManager.PREFIX + 
            Vcomic.Services.ActionManager.ACTION_CONFIG
        );
        menu.append("Acerca de", "about_app");

        var about_action = new SimpleAction("about_app", null);
        pack_end(btnconfig);
    }
}
