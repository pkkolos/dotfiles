import keyring

user = '\x70\x6b\x6b\x6f\x6c\x6f\x73'

gmail_filter = ['[Google Mail]/All Mail',
                '[Google Mail]/Important',
                '[Google Mail]/Starred']

gmail_map = {'INBOX': 'Inbox',
             '[Google Mail]/All Mail': 'Archive',
             '[Google Mail]/Bin': 'Trash',
             '[Google Mail]/Drafts': 'Drafts',
             '[Google Mail]/Important': 'Important',
             '[Google Mail]/Sent Mail': 'Sent',
             '[Google Mail]/Spam': 'Spam',
             '[Google Mail]/Starred': 'Starred'}

outlook_filter = ['Deleted',
                  'Notes',
                  'Outbox']

outlook_map = {'Deleted': 'Trash',
               'Junk': 'Spam'}


def reverse_map(_map):
    return {val: key for key, val in _map.items()}


def nt_remote(_map, folder):
    return _map.get(folder, folder)


def nt_local(_map, folder):
    return reverse_map(_map).get(folder, folder)


def get_username(server):
    return '{}@{}.com'.format(user, server)


def get_password(server):
    return keyring.get_password('offlineimap', get_username(server))
