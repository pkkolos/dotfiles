setopt auto_cd               # if you type foo, and it isn't a command, and it is a directory, go there
setopt pushd_ignore_dups     # don't push multiple copies of the same directory onto the directory stack
setopt always_to_end         # when completing from the middle of a word, move the cursor to the end of the word
setopt auto_menu             # show completion menu on successive tab press; needs setop no_menu_complete to work
setopt complete_in_word      # allow completion from within a word/phrase
setopt hash_list_all         # avoids false reports of spelling errors
setopt no_menu_complete      # do not autoselect the first completion entry
setopt extended_glob         # treat #, ~, and ^ as part of patterns for filename generation
setopt no_nomatch            # leave a pattern for filename generation unchanged, don't print an error
setopt append_history        # zsh sessions will append their history list to the history file, rather than replace it
setopt extended_history      # save timestamp of command and duration
setopt hist_ignore_all_dups  # remove duplicate commands
setopt hist_ignore_space     # ignore commands starting with space
setopt hist_verify           # don't execute, just expand history
setopt inc_append_history    # add comamnds as they are entered, don't wait until shell exit
setopt share_history         # import new commands and append typed commands to history
setopt correct               # correct the spelling of commands
setopt no_correct_all        # don't correct all arguments in a line
setopt no_flow_control       # disable output flow control via start/stop characters
setopt no_hup                # don't kill the running jobs when the shell exits
setopt long_list_jobs        # list jobs in the long format by default
setopt prompt_subst          # enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt no_sh_word_split      # don't split unquoted parameters on expansion
setopt no_beep               # don't beep on error
