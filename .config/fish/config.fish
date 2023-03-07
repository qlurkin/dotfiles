eval (/opt/homebrew/bin/brew shellenv)
set -x PATH "$HOME/.cargo/bin" $PATH
set -x PATH "$HOME/bin" $PATH
set -x PATH "$HOME/opt/flutter/bin" $PATH
set -x PATH "$HOME/opt/nvim-macos/bin" $PATH
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Setting PATH for Python 3.9
# The original version is saved in /Users/lur/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.9/bin" "$PATH"

thefuck --alias | source
zoxide init fish | source
alias please="sudo"
alias plz="sudo"
alias ls="exa --group-directories-first -l"
alias cat="bat"
alias python="python3"
alias py="python3"
alias nv="neovide --multigrid"
alias vim="nvim"
alias vi="nvim"
alias matrix="r-matrix -r"

fish_vi_key_bindings

starship init fish | source

# Setting PATH for Python 3.10
# The original version is saved in /Users/lur/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

# Setting PATH for Python 3.10
# The original version is saved in /Users/lur/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

fish_ssh_agent

# Setting PATH for Python 3.11
# The original version is saved in /Users/lur/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"
