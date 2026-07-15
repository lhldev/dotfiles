if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

eval "$(starship init zsh)"
eval "$(sheldon source)"

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY       # Append history to the file rather than overwriting
setopt SHARE_HISTORY        # Share history across all active terminal sessions
setopt HIST_IGNORE_DUPS     # Prevent consecutive duplicate commands from being logged
