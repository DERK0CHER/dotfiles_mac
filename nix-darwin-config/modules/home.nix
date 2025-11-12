{ config, pkgs, ... }:
{
    # Fish shell (prompt, aliases, init)  
programs.fish = {
  enable = true;
  package = pkgs.fish; 
  # Runs very early; good for agents, env, etc.
  shellInit = ''
    if test -z "$SSH_AUTH_SOCK"
      eval (ssh-agent -c) > /dev/null
    end
  '';

  # Runs for interactive shells.
  interactiveShellInit = ''
    set fish_greeting

    if test -f ~/.cache/ags/user/generated/terminal/sequences.txt
      cat ~/.cache/ags/user/generated/terminal/sequences.txt
    end

    set -g fish_color_command #ECECE7
    set -gx LS_COLORS "di=01;38;2;158;178;119:fi=03;38;2;222;216;192:ln=38;2;198;194;78:or=38;2;164;0;0:mi=38;2;164;0;0:ex=38;2;255;123;123"
  '';

  shellAliases = {
    pamcan = "pacman";
    cl = "clear";
    wc = "wl-copy";          # note: wl-copy isn't on macOS; keep only if you install it
    nrs = "sudo nixos-rebuild switch";
    hms = "home-manager switch";
  };

  # nix-darwin way to define the prompt function
  promptInit = ''
    function fish_prompt
      set -l __salmon  '#ff7b7b'
      set -l __gold    '#ab8d2e'
      set -l __beige   '#ded8c0'

      set_color $__beige
      printf '%s@%s ' $USER (hostname -s)

      set_color $__gold
      printf '%s ' (prompt_pwd)

      set -l __fish_git_prompt_showupstream 0
      set -l __fish_git_prompt_use_informative_chars 1
      set -l __fish_git_prompt_char_dirtystate '✱'
      set -l __fish_git_prompt_color_branch $__gold
      set -l __fish_git_prompt_color_dirty  $__gold
      set -l __fish_git_prompt_color_clean  $__gold
      printf '%s ' (fish_git_prompt)

      set_color $__gold
      printf '> '
      set_color normal
    end
  '';
};
}
