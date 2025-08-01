# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/filippo/.oh-my-zsh"

# FZF setup
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
export FZF_CTRL_T_OPTS="--layout=default --preview 'bat --color=always {}'"
export FZF_ALT_C_OPTS="--layout=default --preview 'tree -C {} | head -200' \
                       --border-label='Directories '"
# Disable pywal color scheme
export FZF_DEFAULT_OPTS="--color=16"


# ZSH history config
HIST_STAMPS="%d/%m/%y %T"
HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf k zsh-autosuggestions notify)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias easyWS='cd /home/filippo/Documenti/bitsharing-ws-docker/api-docker/bitsharing-ws/gt-sharing-ws'
alias macssh='ssh -L 8888:localhost:8080 andrea@macdevelop.local'
alias macsshr='ssh -L 8888:localhost:8080 andrea@10.0.10.100'
alias gitl='git log --graph --oneline --decorate'
alias yarnup='yarn upgrade-interactive'
alias yarnupl='yarn upgrade-interactive --latest'
alias tmuxw='./Personale/tmux.sh work'
alias wgup='wg-quick up wg0'
alias wgdown='wg-quick down wg0' 
alias t='tree -L 2'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias task='go-task -t ~/Taskfile.yml'
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias share-device="scrcpy --window-borderless & disown"


complete -C /home/filippo/Scaricati/terraform terraform

export ASPNETCORE_ENVIRONMENT=Development

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export TERM=xterm-256color

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export ANDROID_HOME="/home/filippo/Android/Sdk"

# To run android studio
export _JAVA_AWT_WM_NONREPARENTING=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Enable control + backspace
bindkey '^H' backward-kill-word

# make android fails if this var is set
unset ANDROID_SDK_ROOT

# Export git rebase i editor
export GIT_EDITOR=micro

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh

# flashlight
export PATH="/home/filippo/.flashlight/bin:$PATH"

# Set AWS sandbox profile
export AWS_PROFILE=sandbox

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/filippo/.dart-cli-completion/zsh-config.zsh ]] && . /home/filippo/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

