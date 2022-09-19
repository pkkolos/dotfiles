import os

from gi.repository import Nautilus, GObject

class OpenTerminalExtension(GObject.GObject, Nautilus.MenuProvider):
    def _open_terminal(self, menu, directory):
        os.system('alacritty --working-directory "%s" &' % directory.get_location().get_path())

    def get_file_items(self, files):
        if len(files) != 1:
            return

        file = files[0]
        if not file.is_directory() or file.get_uri_scheme() != 'file':
            return

        item = Nautilus.MenuItem(name='OpenTerminalExtension::open_in_dir',
                                 label='Open In Alacritty',
                                 tip='Open Terminal In %s' % file.get_name())
        item.connect('activate', self._open_terminal, file)
        return [item]

    def get_background_items(self, directory):
        item = Nautilus.MenuItem(name='OpenTerminalExtension::open_here',
                                 label='Open Alacritty Here',
                                 tip='Open Terminal In This Directory')
        item.connect('activate', self._open_terminal, directory)
        return [item]
