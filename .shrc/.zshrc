# Created by newuser for 5.9

# Source global definitions
if [[ -f /etc/zshrc ]]; then
    source /etc/zshrc
fi

# User specific environment
if [[ ":$PATH:" != *":$HOME/.local/bin:$HOME/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# User specific aliases and functions
if [[ -d ~/.zshrc.d ]]; then
    for rc in ~/.zshrc.d/*; do
        [[ -f "$rc" ]] && source "$rc"
    done
fi
unset rc

# Zoxide initialization for Zsh
eval "$(zoxide init zsh --cmd z --hook prompt)"

# Set up fzf key bindings and fuzzy completion for Zsh
eval "$(fzf --zsh)"

# Customize fzf options for Zoxide
export _ZO_FZF_OPTS="--preview 'ls -lh {}' --preview-window=up:30%:hidden"

# Starship prompt initialization
eval "$(starship init zsh)"

# Alias to open a file using nano with fzf (only if a file is selected)
alias fnano='FILE="$(find ~ /mnt/ -type f | fzf --border --height=40%)"; [[ -n "$FILE" ]] && nano "$FILE"'


# Zsh Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history        # Append new commands to the history file instead of overwriting it
setopt inc_append_history    # Save each command to the history file as soon as it is executed
setopt share_history         # Share command history across multiple terminal sessions



bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
