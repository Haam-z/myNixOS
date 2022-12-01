set -gx sudope_sequence \eu
starship init fish | source
# Replacing Some default commad
  # Cat with bat
    alias cat='bat'
  # grip ripgrip
    alias grip='rg'
  # normal cp/mv/rm to conferming ones
    alias cp="xcp -v"
    alias mv='mv -f'
    alias rm='rm -vrdf'
  # a better ls comands
    alias ls='exa --color=always --icons --group-directories-first' # my preferred listing
    alias la='exa -a --color=always --icons --group-directories-first'  # all files and dirs
    alias ll='exa -l --color=always --icons --group-directories-first'  # long format
    alias lt='exa -aT --color=always --icons  --group-directories-first' # tree listing
    alias l.=' exa -ad .* --color=always --icons --group-directories-first' # listing only hiden files
  # Try and will see
    alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
   # alias for emacs
    alias vi='emacsclient -t'
    alias emacs='emacsclient -a "emacs" -c'
   # alias for ani-cli
    alias dani='ani-cli -p $HOME/Videos/Anime -q best'
    alias wani='ani-cli -q best -v'

# Set Editors ManPage and terminal type
set fish_greeting
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "emacsclient -t"                 # $EDITOR use Emacs in terminal
set VISUAL "emacsclient -c -a emacs"              # $VISUAL use Emacs in GUI mode
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
