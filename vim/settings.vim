let vimsettings = '~/.vim/settings'

for fpath in split(globpath(vimsettings, '*.vim'), '\n')
    execute 'source' fpath
endfor
