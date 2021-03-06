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
        var imbtnopen = new Gtk.Image();
        imbtnopen.set_from_file("../data/images/16/book_open.png");
        btnopen.set_image(imbtnopen);
        btnopen.action_name = Vcomic.Services.ActionManager.PREFIX + 
            Vcomic.Services.ActionManager.ACTION_OPEN_COMIC;

        var btnfullscreen = new Gtk.Button();
        var imbtnfull = new Gtk.Image();
        imbtnfull.set_from_file("../data/images/16/fullscreen.png");
        btnfullscreen.set_image(imbtnfull);
        btnfullscreen.action_name = Vcomic.Services.ActionManager.PREFIX +
            Vcomic.Services.ActionManager.ACTION_FULLSCREEN;

        var btnextpage = new Gtk.Button();
        var imbtnnp = new Gtk.Image();
        imbtnnp.set_from_file("../data/images/16/next.png");
        btnextpage.set_image(imbtnnp);
        btnextpage.action_name = Vcomic.Services.ActionManager.PREFIX + 
            Vcomic.Services.ActionManager.ACTION_NEXT_PAGE;

        var etpage = new Gtk.Entry();

        var btnprevious = new Gtk.Button();
        var imbtnprevious = new Gtk.Image();
        imbtnprevious.set_from_file("../data/images/16/preview.png");
        btnprevious.set_image(imbtnprevious);
        btnprevious.action_name = Vcomic.Services.ActionManager.PREFIX + 
            Vcomic.Services.ActionManager.ACTION_PREVIOUS_PAGE;

        // Crear el menu que ira dentro del popover
        var menu = new GLib.Menu();
        menu.append(
            "Configurar", 
            Vcomic.Services.ActionManager.PREFIX + 
            Vcomic.Services.ActionManager.ACTION_CONFIG
        );
        menu.append(
            "Acerca de",
            Vcomic.Services.ActionManager.PREFIX + 
            Vcomic.Services.ActionManager.ACTION_ABOUT
        );

        // Creando elemento Popover
        var menu_popover = new Gtk.Popover(btnconfig);
        menu_popover.position = Gtk.PositionType.BOTTOM;
        menu_popover.set_size_request (256, -1);
        menu_popover.modal = false;
        menu_popover.bind_model (menu, null);

        btnconfig.clicked.connect (() => {
            menu_popover.set_visible (true);
        });

        pack_end(btnconfig);
        pack_end(btnfullscreen);
        pack_end(btnopen);

        pack_start(btnprevious);
        pack_start(etpage);
        pack_start(btnextpage);
    }
}
