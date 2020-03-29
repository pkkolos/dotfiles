import os
import gi

gi.require_version('Nautilus', '3.0')

from gi.repository import Nautilus, GObject

class OpenTerminalExtension(GObject.GObject, Nautilus.MenuProvider):
    def _open_terminal(self, menu, directory):
        os.system('urxvt -cd "%s" &' % directory.get_location().get_path())

    def get_file_items(self, window, files):
        if len(files) != 1:
            return

        file_ = files[0]
        if not file_.is_directory() or file_.get_uri_scheme() != 'file':
            return

        item = Nautilus.MenuItem(name='OpenTerminalExtension::open_in_dir',
                                 label='Open in Terminal…',
                                 tip='Open Terminal in %s' % file_.get_name())
        item.connect('activate', self._open_terminal, file_)
        return [item]

    def get_background_items(self, window, directory):
        item = Nautilus.MenuItem(name='OpenTerminalExtension::open_here',
                                 label='Open Terminal Here…',
                                 tip='Open Terminal in %s' % directory.get_name())
        item.connect('activate', self._open_terminal, directory)
        return [item]
