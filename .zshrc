# Path to your oh-my-zsh installation.
export ZSH=/home/zemnl/.oh-my-zsh
export XDG_CONFIG_HOME="$HOME/.config"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="zu2"
#ZSH_THEME="pure"
#TERM=rxvt-unicode-256color
#TERM=screen-256color

alias infocat="~/sh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"
typeset -A ZSH_HIGHLIGHT_STYLES
source $ZSH/oh-my-zsh.sh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
#ZSH_HIGHLIGHT_STYLES[main]='bold'
ZSH_HIGHLIGHT_STYLES[path]='bold'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[command]='bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,bold'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
setopt HIST_IGNORE_DUPS
eval "$(dircolors ~/.dircolors)"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
winhd=/run/media/$USER/AC50C25750C227C2
alias vim='nvim'
alias vi='/usr/bin/vim'
mnt(){
	udisksctl mount --block-device $1
}
umnt(){
	udisksctl unmount --block-device $1
}
man() {
	if [ "$TERM" = 'linux' ]; then
		env \
			LESS_TERMCAP_mb=$(printf "\e[34m") \
			LESS_TERMCAP_md=$(printf "\e[1;31m") \
			LESS_TERMCAP_me=$(printf "\e[0m") \
			LESS_TERMCAP_se=$(printf "\e[0m") \
			LESS_TERMCAP_so=$(printf "\e[30;43m") \
			LESS_TERMCAP_ue=$(printf "\e[0m") \
			LESS_TERMCAP_us=$(printf "\e[32m") \
					/usr/bin/man "$@"
	else
		env \
			LESS_TERMCAP_mb=$(printf "\e[1;34m") \
			LESS_TERMCAP_md=$(printf "\e[38;5;9m") \
			LESS_TERMCAP_me=$(printf "\e[0m") \
			LESS_TERMCAP_se=$(printf "\e[0m") \
			LESS_TERMCAP_so=$(printf "\e[30;43m") \
			LESS_TERMCAP_ue=$(printf "\e[0m") \
			LESS_TERMCAP_us=$(printf "\e[38;5;10m") \
					/usr/bin/man "$@"
	fi
}
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
