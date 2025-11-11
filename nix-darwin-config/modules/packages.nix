{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Editors / Terminals
    vim
    kitty
    neovim
    vscodium

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
  ];
}

