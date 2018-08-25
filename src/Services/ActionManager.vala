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

public class Vcomic.Services.ActionManager : Object {
    public weak Vcomic.Window window { get; construct; }
    public weak Vcomic.Application app { get; construct; }

    public SimpleActionGroup actions { get; construct; }

    public const string PREFIX = "win.";
    // Abrir el buscador de comic
    public const string ACTION_OPEN_COMIC = "action_open_comic";
    // Mostrar pagina siguiente
    public const string ACTION_NEXT_PAGE = "action_next_page";
    // Mostrar pagina anterior
    public const string ACTION_PREVIOUS_PAGE = "action_previous_page";
    // Mostrar página especifica
    public const string ACTION_NUM_PAGE = "action_num_page";
    // Cerrar la aplicación
    public const string ACTION_QUIT = "action_quit";

    public const string ACTION_CONFIG = "action_config";

    public static Gee.MultiMap<string, string> action_accelerators = new
        Gee.HashMultiMap<string, string> ();

    private const ActionEntry[] action_entries = {
        {ACTION_OPEN_COMIC, action_open_comic},
        {ACTION_NEXT_PAGE, action_next_page},
        {ACTION_PREVIOUS_PAGE, action_previous_page},
        {ACTION_NUM_PAGE, action_num_page},
        {ACTION_QUIT, action_quit}
    };

    public ActionManager (Vcomic.Application app_vcomic,
        Vcomic.Window main_window){
        Object(
            app: app_vcomic,
            window: main_window
        );
    }

    static construct {
        action_accelerators.set( ACTION_OPEN_COMIC, "<Control>o");
        // action_accelerators.set( ACTION_NEXT_PAGE, "<Control>")
    }

    construct {
        actions = new SimpleActionGroup();
        actions.add_action_entries(action_entries, this);
        window.insert_action_group("win", actions);

        foreach (var action in action_accelerators.get_keys()) {
            app.set_accels_for_action(PREFIX + action,
                action_accelerators[action].to_array());
        }
    }

    private void action_quit () {
        // window.before_destroy();
    }

    /**
    * Abrir el buscador de archivos para identificar el comic a abrir
    **/
    private void action_open_comic() {
        print("Abrir ");
        window.titlebar.title = "Vcomic";
        window.titlebar.subtitle = "nombre_del_comic";
    }

    private void action_next_page() {
        print("página siguiente");
    }

    private void action_previous_page() {
        print("Página anterior");
    }

    private void action_num_page(){
        print("Set page num");
    }

    public static void action_from_group (string action_name,
        ActionGroup? action_group){
        action_group.activate_action(action_name, null);
    }
}
