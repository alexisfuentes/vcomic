conf_data = configuration_data()
conf_data.set('PROJECT_NAME', meson.project_name())
conf_data.set('EXEC_NAME', meson.project_name())
conf_data.set('DATADIR', get_option('datadir'))
conf_data.set('PKGDATADIR', get_option('datadir') + '/' + meson.project_name())
conf_data.set('GETTEXT_PACKAGE', meson.project_name())
conf_data.set('RELEASE_NAME', 'Vcomic')
conf_data.set('VERSION', '0.0.1')
conf_data.set('VERSION_INFO', 'Comic display')
conf_data.set('PREFIX', get_option('prefix'))

# config_header = configure_file(
#    input: 'config.vala.in',
#    output: 'config.vala',
#    configuration: conf_data
# )

executable(
    meson.project_name(),
    'Main.vala',
    'Application.vala',
    'Window.vala',

    'Layouts/HeaderBar.vala',
    'Layouts/Main.vala',
    'Layouts/TreeView.vala',
    
    'Services/ActionManager.vala',
    asresources,
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('gee-0.8'),
    ],
    install: false
)