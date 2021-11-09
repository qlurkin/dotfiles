eval (/opt/homebrew/bin/brew shellenv)
set -x PATH "$HOME/.cargo/bin" $PATH
set -x PATH "$HOME/bin" $PATH
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Setting PATH for Python 3.9
# The original version is saved in /Users/lur/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.9/bin" "$PATH"

thefuck --alias | source
alias please="sudo"
alias plz="sudo"
alias ls="exa"
alias cat="bat"
alias python="python3"

fish_vi_key_bindings

starship init fish | source
