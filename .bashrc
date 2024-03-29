#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias rm='false'
alias ls='ls --color'
alias ll='ls --color -l'
alias grep='grep --color'
alias java='unset _JAVA_OPTIONS; java'
alias cal='cal -m'
alias ssh='TERM=rxvt ssh'
alias hexedit='hexedit -l16'
alias bc='bc -ql'
alias pdflatex='pdflatex -interaction=nonstopmode'
alias xelatex='xelatex -interaction=nonstopmode'
alias mysql='mysql --sigint-ignore'
alias neww='tmux neww'
alias newww='tmux neww && tmux neww'
alias newwww='tmux neww && tmux neww && tmux neww'
alias hackerman='cmatrix'
alias ytdl='youtube-dl -i -o "%(upload_date)s %(title)s-%(uploader)s-%(id)s.%(ext)s"'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

function find_exclude_mnt() {
    path="$1"
    if [[ -z $path ]]; then
       path="."
    fi
    shift
    find "$path" -not \( -path "/mnt" -prune \) "$@"
}
alias find='find_exclude_mnt'

# PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
PATH="$PATH:$HOME/Android/Sdk/tools"
PS1='[\[\033[34;1m\]\u@\h\[\033[m\] \w]\[\033[34;1m\]\$\[\033[m\] '
export EDITOR='emacsclient -a vim'
export XMODIFIERS=@im=ibus
export LIBVIRT_DEFAULT_URI='qemu:///system'

# Disable Software Flow Control Ctrl-s
stty -ixon
# Disable Ctrl-z
stty susp undef

shopt -s checkwinsize
