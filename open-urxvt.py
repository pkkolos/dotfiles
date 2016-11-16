# -*- coding: UTF-8 -*-

import os
import gi

gi.require_version('Nautilus', '3.0')

from gi.repository import Nautilus, GObject, Gio


class URxvtExtension(GObject.GObject, Nautilus.MenuProvider):
    FILE_ATTRIBUTES = Gio.FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME
    FILE_FLAGS = Gio.FileQueryInfoFlags.NONE

    def _open_terminal(self, menu, path):
        os.system('urxvt -cd "%s" &' % path)

    def get_file_items(self, window, files):
        if len(files) != 1:
            return

        file_ = files[0]
        if not file_.is_directory() or file_.get_uri_scheme() != 'file':
            return

        gfile = file_.get_location()
        path = gfile.get_path()

        # Get UTF-8 version of basename
        info = gfile.query_info(self.FILE_ATTRIBUTES, self.FILE_FLAGS, None)
        filename = info.get_attribute_as_string(self.FILE_ATTRIBUTES)

        item = Nautilus.MenuItem(name='URxvtExtension::open_in_dir',
                                 label=u'Open in URxvt…',
                                 tip=u'Open URxvt in %s' % path)
        item.connect('activate', self._open_terminal, path)
        return [item]

    def get_background_items(self, window, directory):
        path = directory.get_location().get_path()
        item = Nautilus.MenuItem(name='URxvtExtension::open_here',
                                 label=u'Open URxvt Here…',
                                 tip=u'Open URxvt in this directory')
        item.connect('activate', self._open_terminal, path)
        return [item]
