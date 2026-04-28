{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Editors / Terminals
    qemu
android-tools
    vim
    kitty
    discord
    neovim
    vscodium
    fish
    protonmail-desktop
    yazi
    aerospace
    yabai
    code-cursor
    rename
    tree
texstudio
texliveTeTeX
    obsidian
    docker
    docker-compose


    # Browser
    firefox

    # System utilities
    git
    curl
    btop
    feh
    libnotify
    ttfautohint
rPackages.rosetta
    # Communication / Mail / etc.
    vesktop
    thunderbird
    spotify

    # Dev tools
    gcc
    clang
    meson

              clang
              ninja
    gnumake
    nodejs
    pnpm
    pngpaste
    ripgrep
    fd
    gtksourceview3
    gtk3
    glib
    cmake
    pkg-config
    poppler       # Für PDF Vorschau
    intltool

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

