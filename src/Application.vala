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

/*namespace Vcomic {
    public Vcomic.Services.Settings settings;
}*/

public class Vcomic.Application : Gtk.Application {

    public GLib.List<Window> windows;

    construct{
        application_id = "com.github.alexisfuentes.vcomic";
        flags |= ApplicationFlags.HANDLES_OPEN;

        windows = new GLib.List<Window>();
    }

    public void new_window() {
        new Vcomic.Window(this).present();
    }

    public override void window_added (Gtk.Window window) {
        windows.append(window as Window);
        base.window_added(window);
    }

    public override void window_removed (Gtk.Window window) {
        window.remove (window as Window);
        base.window_removed(window);
    }

    public override void activate() {
        var window = new Vcomic.Window(this);
        this.add_window(window);
    }
}
