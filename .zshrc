autoload -U promptinit && promptinit
prompt pure # set pure prompt

# cd history
setopt AUTO_PUSHD

# Options
umask 022
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt NOTIFY
setopt NOHUP
setopt MAILWARN

# save history
SAVEHIST=1000000
HISTSIZE=1000000
HISTFILE=$HOME/.zsh_history


source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bind P and N for EMACS mode
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey -M emacs '^P' history-substring-search-down
bindkey -M emacs '^N' history-substring-search-up

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
