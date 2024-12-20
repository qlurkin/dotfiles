eval (/opt/homebrew/bin/brew shellenv)
set -x PATH "$HOME/.cargo/bin" $PATH
set -x PATH "$HOME/bin" $PATH
set -x PATH "$HOME/opt/flutter/bin" $PATH
set -x PATH "$HOME/opt/nvim-macos/bin" $PATH
set -x PATH "$HOME/.local/bin" $PATH
if status is-interactive
    # Commands to run in interactive sessions can go here
end

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
alias km="sudo kmonad ~/.config/kmonad/config.kbd"
# alias love="/Applications/love.app/Contents/MacOS/love"

fish_vi_key_bindings

starship init fish | source

# fish_ssh_agent

# Setting PATH for Python 3.13
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.13/bin" $PATH
