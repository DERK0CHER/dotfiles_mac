{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Editors / Terminals
    vim
    kitty
    neovim
    vscodium
    fish
    protonmail-desktop
    yazi
    aerospace
    yabai
    code-cursor


    # Browser
    firefox

    # System utilities
    git
    curl
    btop
    feh
    libnotify
    ttfautohint

    # Communication / Mail / etc.
    vesktop
    thunderbird
    spotify

    # Dev tools
    gcc
    clang
    meson
    gnumake
    nodejs
    pnpm
    pngpaste
    ripgrep
    fd

    # Node formatters
    nodePackages.prettier
    nodePackages.eslint_d

    # Python formatters
    black
    python3Packages.isort

    # Other formatters / tools
    stylua
    shfmt
    clang-tools
    nixfmt

    # LaTeX helper
    python3Packages.pylatexenc

    #for neovim
        go
        cargo
        luarocks
        ruby
        php
        jdk
        julia-bin
        phpPackages.composer
        ghostscript
        tectonic
        mermaid-cli
        (pkgs.python3.withPackages (ps: [ ps.pip ps.venvShellHook ]))
  ];
}

