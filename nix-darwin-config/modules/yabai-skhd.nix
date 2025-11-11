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
    '';
  };

  ################
  # SKHD
  ################
  services.skhd = {
    enable = true;
    package = pkgs.skhd;

    skhdConfig = ''
      # Launch terminal
      alt - return : open -na "Kitty"

      # Focus windows (vim-style)
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      # Move windows
      shift + alt - h : yabai -m window --swap west
      shift + alt - j : yabai -m window --swap south
      shift + alt - k : yabai -m window --swap north
      shift + alt - l : yabai -m window --swap east

      # Resize windows
      ctrl + alt - h : yabai -m window --resize left:-20:0
      ctrl + alt - l : yabai -m window --resize right:20:0
      ctrl + alt - j : yabai -m window --resize bottom:0:20
      ctrl + alt - k : yabai -m window --resize top:0:-20
    '';
  };
}

