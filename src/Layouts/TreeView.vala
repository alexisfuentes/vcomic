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

public class Vcomic.Layouts.TreeView : Gtk.TreeView {
    public weak Vcomic.Window window { get; construct; }

    public ListStore(){
        Object(
            typeof (Gdk.Pixbuf)
        );
        // Creamos columna que contendra las images
        AppendColumn ("Pages", new Gtk.CellRendererPixbuf (), "pixbuf", 0);
    }

    /**
     * Lista de imagenes a mostrar
     */
    public void SetListImages (List<Gdk.Pixbud> Images){
        Images.foreach ((img) => {
            AppendValues(img);
        });
    }
}