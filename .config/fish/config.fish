set -l os (uname)
if test "$os" = Darwin
    eval (/opt/homebrew/bin/brew shellenv)
end
set -x PATH "$HOME/.cargo/bin" $PATH
set -x PATH "$HOME/bin" $PATH
set -x PATH "$HOME/.local/bin" $PATH
set -x PATH "$HOME/opt/slang/bin" $PATH
# set -x PATH "$HOME/opt/zig" $PATH
if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish | source
alias please="sudo"
alias plz="sudo"
alias ls="eza --group-directories-first -l"
alias cat="bat"
alias python="python3"
alias py="python3"
alias nv="neovide --multigrid"
alias vim="nvim"
alias vi="nvim"
alias matrix="r-matrix -r"
alias km="sudo kmonad ~/.config/kmonad/config.kbd"
alias zig14="~/opt/zig-macos-aarch64-0.14.0-dev.2628+5b5c60f43/zig"
alias dbget="python3 ~/Program/spriteget/spriteget.py"
alias deepseek="ollama run deepseek-r1:1.5b"
# alias love="/Applications/love.app/Contents/MacOS/love"

fish_vi_key_bindings

starship init fish | source

# fish_ssh_agent

# Setting PATH for Python 3.13
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.13/bin" $PATH
