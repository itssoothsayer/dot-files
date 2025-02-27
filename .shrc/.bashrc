# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Zoxide
eval "$(zoxide init bash --cmd z --hook prompt)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
# Customize fzf options for zoxide
export _ZO_FZF_OPTS="--preview 'ls -lh {}' --preview-window=up:30%:hidden"

eval "$(starship init bash)"

alias fnano='FILE="$(find ~ /mnt/ -type f | fzf --border --height=40%)"; [ -n "$FILE" ] && nano "$FILE"'
