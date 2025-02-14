# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,exports,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH;
export EDITOR=/usr/local/bin/emacs;


export CHANGE_VOLUME=true;

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
# export PATH

export PATH="$PATH:"/Applications/microchip/xc8/v2.45/bin""
export PATH=$PATH:/usr/local/share/pk2

eval "$(pyenv virtualenv-init -)"


#enabling itermplot
# export MPLBACKEND="module://itermplot";
export ITERMPLOT=rv;

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1;

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color;

export ASPELL="/usr/local/bin/aspell";

export PREZIP="/usr/local/bin/prezip-bin";

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

#. "$HOME/.cargo/env"

export PATH="$PATH:"/Applications/microchip/xc8/v2.45/bin""

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

