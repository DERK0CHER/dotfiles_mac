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
      yabai -m config mouse_modifier alt

      yabai -m config mouse_action1 move
      yabai -m config mouse_action1 resize

      # gaps & padding
      yabai -m config window_gap 4
      yabai -m config top_padding 0
      yabai -m config bottom_padding 4
      yabai -m config left_padding 4
      yabai -m config right_padding 4

      yabai -m config window_animation_duration 0.0

      yabai -m rule --add app="System Settings" manage=off
      yabai -m rule --add app="App Store" manage=off
      yabai -m config focus_follows_mouse autofocus

    '';
  };

  ################
  # SKHD
  ################
# services.skhd = {
#   enable = true;
#   package = pkgs.skhd;
#
# skhdConfig = 
# ''
# ctrl + alt - 1 : yabai -m window --space 1;
# ctrf + alt - 2 : yabai -m window --space 2;
# ctrf + alt - 3 : yabai -m window --space 3;
# ctrf + alt - 4 : yabai -m window --space 4;
# ctrf + alt - 5 : yabai -m window --space 5;
# ctrf + alt - 6 : yabai -m window --space 6;
# ctrf + alt - 7 : yabai -m window --space 7;
# ctrf + alt - 8 : yabai -m window --space 8;
# ctrf + alt - 9 : yabai -m window --space 9;
# ctrf + alt - 0 : yabai -m window --space 10;
# # change window focus within space
# alt - j : yabai -m window --focus south
# alt - k : yabai -m window --focus north
# alt - h : yabai -m window --focus west
# alt - l : yabai -m window --focus east
#
# #change focus between external displays (left and right)
# alt - s: yabai -m display --focus west
# alt - g: yabai -m display --focus east
#
# # rotate layout  
# shift + alt - r : yabai -m space --rotate 270
#
# # flip along y-axis
# shift + alt - y : yabai -m space --mirror y-axis
#
# # flip along x-axis
# shift + alt - x : yabai -m space --mirror x-axis
#
# # toggle window float
# shift + alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2
#
# # maximize a window
# shift + alt - m : yabai -m window --toggle zoom-fullscreen
#
# # balance out tree of windows (resize to occupy same area)
# shift + alt - e : yabai -m space --balance
#
#
# # stop/start/restart yabai
# ctrl + alt - q : yabai --stop-service
# ctrl + alt - s : yabai --start-service
# ctrl + alt - r : yabai --restart-service
# '';
# };
}

