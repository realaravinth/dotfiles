# Path to your oh-my-bash installation.
export OSH=/home/aravinth/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="font"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

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

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

source $OSH/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"

alias vim=nvim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash



# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
#alias zshconfig="mate ~/.zshrc"
#alias ohmyzsh="mate ~/.oh-my-zsh"

~/dotfiles/scripts/login.sh

export ass=samsung-gtel3g
export PATH=$PATH:~/.local/bin/:~/.cargo/bin/:~/go/bin/:~/yarn/bin/:/home/aravinth/.gem/ruby/2.7.0/bin:/home/aravinth/.rustup/toolchains/*/bin/
export PATH=$PATH:~/workspace/fabric/bin:~/dotfiles/scripts:~/bin/:~/dotfiles/scripts/redis/
export outdir=/home/aravinth/.local/var/pmbootstrap/chroot_native/home/pmos/build/src
export pmos_apk=~/.local/var/pmbootstrap/cache_git/pmaports/device/testing/

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias vim="nvim"
alias firefox='firefox-developer-edition'
alias listen='tshark -i enp8s0 -w /tmp/testing.pcapng'
alias upload="getq.sh"
alias cwd="copydir"

source ~/dotfiles/.env/bw

alias rm="/usr/bin/safe-rm"

alias ws="web_search searx"
alias wss="web_search duckduckgo"
alias crs="wss \!crates"
alias aur="wss \!aur"
alias awiki="wss \!archwiki"
alias rstd="wss \!rustd"
alias drs="wss \!drs"
alias gh="firefox https://github.com/realaravinth"

alias cac="cargo c"
alias cr="cargo r"
alias crr="cargo r --release"
alias ct="cargo t"
alias cb="cargo b"
alias cbb="cargo bench"
alias ccd="cargo doc"
alias ctr="cargo t --release"
alias cat="/usr/bin/bat"
alias bat="/usr/bin/cat"
alias tt="feh -F ~/Pictures/tt.png"
alias ttt="feh -F ~/Pictures/ttt.png"
alias p="powerpill"

export BOOKS=~/Syncthing/Books
export RES=/srv/res/

#eval "$(starship init zsh)"
alias dw='aria2c --file-allocation=none -c -x 12 -s 12 -d .'

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# React helper:
source ~/dotfiles/scripts/react/helper.sh
alias cdt="cd /tmp/"
save() {
	URL="https://web.archive.org/save/$1"
	echo "Saving $URL"
	curl $URL
}

alias gg="gotify push"
alias ff="find $(pwd) | rg "

# tex stuff
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

# bluetooth headset conn
alias ble="bluetoothctl connect 38:18:4C:11:C7:63 | tail -n 1 | grep 'Connection successful'"
alias dn="dnote"
alias loc="tokei"


# volume
alias mute="pactl set-sink-mute"
source ~/dotfiles/scripts/audio


alias ls=exa

# shortcuts

# cd into shortcut dir
scd() {
	cd $(sc -f $1)
}

# bat shortcut file
scb() {
	/usr/bin/bat $(sc -f $1)
}

# cat shortcut file
scc() {
	/usr/bin/cat $(sc -f $1)
}

# open in vim
scv() {
	/usr/bin/nvim $(sc -f $1)
}

# add current directory
scad() {
	sc -a $1 $(pwd)
}

# Open files with fzf and xdg-open
f() {
	local files
	IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
	[[ -n "$files" ]] && xdg-open "${files[@]}"
}

# Get sonarqube logins
source ~/dotfiles/.env/sonarqaube

alias yt="yarn test"
alias yb="yarn build"
alias yd="yarn doc"

notification_causing_apps=("telegram-desktop" "element-desktop" "discord")
# instantly kill all notification-causing programs:
cloak() {
	for app in ${notification_causing_apps[@]}
	do 
		killall $app || true
	done
}

# restore apps killed by cloak:
uncloak(){
	for app in ${notification-_ausing_apps[@]}
	do 
		exec $app&
	done
}

ctemp() {
	cd $(mktemp -d)
}

cctemp() {
	cd $(mktemp -d)
	cargo init a
	cd a
}
alias pubip="nc ipv4.cat 80"

alias rm=trash
alias rrm=/bin/rm
daily-events

# Workspace bins
export PATH=$PATH:~/.local/bin/:~/.cargo/bin/:~/go/bin/:~/yarn/bin/:/home/aravinth/.gem/ruby/2.7.0/bin:/home/aravinth/.rustup/toolchains/*/bin/
export PATH=$PATH:~/workspace/fabric/bin:~/dotfiles/scripts:~/bin/:~/dotfiles/scripts/redis/
export PATH=$PATH:/opt/hub/bin
