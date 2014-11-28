# directories
  setopt auto_cd               # if you type foo, and it isn't a command,
                               # and it is a directory, go there
  setopt pushd_ignore_dups     # don't push multiple copies of the same
                               # directory onto the directory stack

# completion
  setopt always_to_end         # when completing from the middle of a word,
                               # move the cursor to the end of the word
  setopt complete_in_word      # allow completion from within a word/phrase
  setopt auto_menu             # show completion menu on successive tab press;
                               # needs setop no_menu_complete to work
unsetopt menu_complete         # do not autoselect the first completion entry

# globbing & autocorrect
  setopt extended_glob         # treat #, ~, and ^ as part of patterns
                               # for filename generation
unsetopt nomatch               # leave a pattern for filename generation
                               # unchanged, don't print an error
  setopt prompt_subst          # enable parameter expansion, command
                               # substitution, and arithmetic expansion
                               # in the prompt
  setopt correct               # correct the spelling of commands
unsetopt correct_all           # don't correct all arguments in a line

# history
  setopt append_history        # zsh sessions will append their history list to
                               # the history file, rather than replace it
  setopt inc_append_history    # add comamnds as they are entered,
                               # don't wait until shell exits
  setopt share_history         # import new commands and append typed commands
                               # to history
  setopt extended_history      # save timestamp of command and duration
  setopt hist_ignore_all_dups  # remove duplicate commands
  setopt hist_ignore_space     # ignore commands starting with space
  setopt hist_verify           # don't execute, just expand history

# job control
unsetopt hup                   # don't kill the running jobs
                               # when the shell exits
  setopt long_list_jobs        # list jobs in the long format by default

# other
unsetopt sh_word_split         # don't split unquoted parameters on expansion
unsetopt flow_control          # disable output flow control via
                               # start/stop characters
unsetopt beep                  # don't beep on error
