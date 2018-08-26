# valac --pkg gtk+-3.0 --pkg gee-0.8 Main.vala Application.vala Window.vala Layouts/HeaderBar.vala Services/ActionManager.vala
project('com.github.alexis.fuentes.vcomic', 'vala', 'c')

# Include gnome module
gnome = import('gnome')

asresources = gnome.compile_resources(
    'as-resources', 'data/assets.gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)

subdir('src')
subdir('data')

# meson.add_install_script('meson/post_install.py')