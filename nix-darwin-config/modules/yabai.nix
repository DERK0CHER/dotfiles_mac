{ config, pkgs, ... }:

{
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = false;

    extraConfig = ''
      yabai -m config focus_follows_mouse autofocus

      yabai -m config mouse_modifier alt
      yabai -m config mouse_action1 move
      yabai -m config mouse_action2 resize
    '';
  };
}
