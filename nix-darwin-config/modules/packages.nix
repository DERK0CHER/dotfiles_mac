{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Editors / Terminals
    vim
    kitty
    neovim
    vscodium
    yabai
    skhd
    jq
    fish
    protonmail-desktop

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

