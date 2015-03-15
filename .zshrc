source ~/antigen/antigen.zsh
# source ~/bin/tmuxinator.zsh
# source /Users/SkyFold/git_projects/zsh-prompt-powerline/powerline_config.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle command-not-found
antigen bundle colored-man

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle arialdomartini/oh-my-git

# Load the theme.
# antigen theme arialdomartini/oh-my-git-themes arialdo-granzestyle
antigen theme pure
/usr/local/opt/coreutils/libexec/gnubin/shuf -n 1 ~/.wargames

# Tell antigen that you're done.
antigen apply

# C_INCLUDE_PATH
export C_INCLUDE_PATH="/usr/local/CrossPack-AVR/include:$C_INCLUDE_PATH"

# PATH
export PATH="$HOME/.composer/vendor/bin:/usr/local/gnat/bin:/usr/local/texlive/2014/bin/x86_64-darwin:/usr/local/opt/coreutils/libexec/gnubin:$HOME/bin:/usr/local/bin:/usr/local/CrossPack-AVR/bin:/Users/SkyFold/.rvm/:$PATH"

# MANPATH
export MANPATH="/usr/local/CrossPack-AVR/man:$MANPATH"

# Example aliases
alias turnOffInternalKeyboard="sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"
alias turnOnInternalKeyboard="sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"
alias vi="nvim"
alias v="nvim"
alias chrome="open -a /Applications/Google\ Chrome.app"
alias fire="open -a /Applications/Firefox.app"
alias webit="wget -pkb"
alias 3300ubuntu="/Applications/VirtualBox.app/Contents/MacOS/VBoxHeadless -s 3300ubuntu&"
alias ubuntu_server="/Applications/VirtualBox.app/Contents/MacOS/VBoxHeadless -s ubuntu_server&"
alias pin="ping google.com"
alias ls="ls --color"
alias l="ls"

# Env variables
export EDITOR='nvim'
export PKG_CONFIG_PATH="/opt/X11/lib/pkgconfig/"

## nvm config (Node Version manager)
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# # `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

# Give me C-S and C-Q back
setopt noflowcontrol
stty -ixon
stty -ixoff

# Dircolors
eval `dircolors ~/.dir_colors/dircolors.ansi-dark`

# Ruby Completion
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Make Zsh awsome
## switch between vim easily
foreground-vi() {
    fg %nvim
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

## saves your dirstack
DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
