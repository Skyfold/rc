# source ~/antigen/antigen.zsh
# 
# # Load the oh-my-zsh's library.
# antigen use oh-my-zsh
# 
# # Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle command-not-found
# antigen bundle colored-man
# 
# # Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle arialdomartini/oh-my-git
# 
# # Load the theme.
# # antigen theme arialdomartini/oh-my-git-themes arialdo-granzestyle
# antigen theme pure
# 
# # Tell antigen that you're done.
# antigen apply

# PATH
##export PATH="$HOME/.cabal/bin:$PATH"
export PATH="/usr/local/gnat/bin:/usr/local/texlive/2014/bin/x86_64-darwin:/usr/local/opt/coreutils/libexec/gnubin:$HOME/bin:/usr/local/bin:$PATH"

# Example aliases
alias scanLocalSubnet="nmap -p 22 --open -sV 10.0.0.0/24 > sshservers"
alias gitIgnoreAllUntrackedFiles="echo "$(git status --porcelain | grep '^??' | cut -c4-)" >>.gitignore"
alias turnOffInternalKeyboard="sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"
alias turnOnInternalKeyboard="sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"
alias vi="vim"
alias chrome="open -a /Applications/Google\ Chrome.app"
alias fire="open -a /Applications/Firefox.app"
alias webit="wget -pkb"
alias 3300ubuntu="/Applications/VirtualBox.app/Contents/MacOS/VBoxHeadless -s 3300ubuntu&"
alias ubuntu_server="/Applications/VirtualBox.app/Contents/MacOS/VBoxHeadless -s ubuntu_server&"
alias Fedora="/Applications/VirtualBox.app/Contents/MacOS/VBoxHeadless -s Fedora&"
alias pin="ping google.com"
alias l="ls --color"

# Env variables
export EDITOR='nvim'

# # `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

# Give me C-S and C-Q back
setopt noflowcontrol
stty -ixon
stty -ixoff

# Dircolors
eval `dircolors ~/.dir_colors/dircolors.ansi-dark`

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

## fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
