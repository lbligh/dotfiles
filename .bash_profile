# Load .bashrc if available
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Set PATHS
if [ -x "/opt/homebrew/bin/brew" ]; then
    # For Apple Silicon Macs
    export PATH="/opt/homebrew/bin:$PATH"
fi

# Set PIPX environment variables
if [ -d "/opt/pipx" ]; then
    export PIPX_HOME="/opt/pipx"
    export PIPX_BIN_DIR="/opt/pipx/bin"
    export PIPX_MAN_DIR="/opt/pipx/share/man"

    export PATH="/opt/pipx/bin:$PATH"
fi

# Add Rust and Cargo
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

export EDITOR=/usr/local/bin/emacs

eval "$(pyenv virtualenv-init -)"
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2>/dev/null
done

# Add tab completion for many Bash commands
if which brew &>/dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
    # Ensure existing Homebrew v1 completions continue to work
    export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d"
    source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh
