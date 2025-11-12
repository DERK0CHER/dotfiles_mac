{ config, pkgs, ... }:
{
  ################
  # YABAI
  ################
  services.yabai = {
    enable = true;
    package = pkgs.yabai;

    # Don't do SIP/scripting-addition stuff yet.
    # We keep it simple & safe.
    # enableScriptingAddition = true;  # only later if you explicitly want it

    extraConfig = ''

      # basic behavior
      yabai -m config layout bsp
      yabai -m config auto_balance on

      # gaps & padding
      yabai -m config window_gap 8
      yabai -m config top_padding 8
      yabai -m config bottom_padding 8
      yabai -m config left_padding 8
      yabai -m config right_padding 8

      # speed things up a bit
      yabai -m config window_animation_duration 0.0

      # don't tile some apps
      yabai -m rule --add app="System Settings" manage=off
      yabai -m rule --add app="App Store" manage=off
yabai -m config focus_follows_mouse autofocus

    '';
  };

  ################
  # SKHD
  ################
  services.skhd = {
    enable = true;
    package = pkgs.skhd;

skhdConfig = ''
  # Launch terminal (robust: prefer kitty if available, else use open -a)
  alt - return : /bin/sh -c 'command -v /run/current-system/sw/bin/kitty >/dev/null 2>&1 && /run/current-system/sw/bin/kitty >/dev/null 2>&1 & || open -a Kitty &'

  # Focus windows (vim-style) ...
  alt - h : /run/current-system/sw/bin/yabai -m window --focus west
  alt - j : /run/current-system/sw/bin/yabai -m window --focus south
  alt - k : /run/current-system/sw/bin/yabai -m window --focus north
  alt - l : /run/current-system/sw/bin/yabai -m window --focus east

  # Move windows
  shift + alt - h : /run/current-system/sw/bin/yabai -m window --swap west
  shift + alt - j : /run/current-system/sw/bin/yabai -m window --swap south
  shift + alt - k : /run/current-system/sw/bin/yabai -m window --swap north
  shift + alt - l : /run/current-system/sw/bin/yabai -m window --swap east

  # Resize windows
  ctrl + alt - h : /run/current-system/sw/bin/yabai -m window --resize left:-20:0
  ctrl + alt - l : /run/current-system/sw/bin/yabai -m window --resize right:20:0
  ctrl + alt - j : /run/current-system/sw/bin/yabai -m window --resize bottom:0:20
  ctrl + alt - k : /run/current-system/sw/bin/yabai -m window --resize top:0:-20

  # Switch to space N
  alt - 1 : /run/current-system/sw/bin/yabai -m space --focus 1
  alt - 2 : /run/current-system/sw/bin/yabai -m space --focus 2
  ...
  alt - 0 : /run/current-system/sw/bin/yabai -m space --focus 10

  # Move focused window to space N (and follow it)
  shift + alt - 1 : /run/current-system/sw/bin/yabai -m window --space 1 ; /run/current-system/sw/bin/yabai -m space --focus 1
  ...
  shift + alt - 0 : /run/current-system/sw/bin/yabai -m window --space 10 ; /run/current-system/sw/bin/yabai -m space --focus 10

  # create new space & move focused window there (call script)
  shift + alt - n : /home/youruser/.local/bin/yabai_create_and_move.sh

  # focus or switch (use script, pass index)
  alt - 3 : /home/youruser/.local/bin/yabai_focus_or_switch.sh 3
'';
  };
}

