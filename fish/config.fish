## ~/.config/fish/config.fish
# Put ~/bin before everything else
set -x PATH $HOME/bin /usr/local/bin $HOME/.local/bin /Library/TeX/texbin $PATH
# ————————————————————————
# 1) Initialize Homebrew’s env exactly once
eval (/opt/homebrew/bin/brew shellenv)

# ————————————————————————
# 2) Set XDG_DATA_DIRS to a single colon‑delimited string,
#    so GLib-based apps find your Homebrew XML data
set -l brew_share (brew --prefix)/share
if set -q XDG_DATA_DIRS
    # quote the whole thing so it’s a single argument
    set -x XDG_DATA_DIRS "$brew_share:$XDG_DATA_DIRS"
else
    set -x XDG_DATA_DIRS "$brew_share"
end

# ————————————————————————
# 4) Prepend common bin dirs to PATH
set -x PATH /usr/local/bin $HOME/.local/bin /Library/TeX/texbin $PATH

# ————————————————————————
# 5) Extend MANPATH
set -Ux MANPATH $MANPATH $HOME/.local/man/

# ————————————————————————
# 6) Interactive‑only tweaks
if status is-interactive
    set -g fish_greeting ""

    function fish_greeting
        echo (set_color magenta)"
        (\__/)
        (•ㅅ•)  ~
        / 　 づ  Fish shell ready!
        >°)))彡 ~
    "(set_color normal)
    end
    # …add other interactive stuff here…
end
