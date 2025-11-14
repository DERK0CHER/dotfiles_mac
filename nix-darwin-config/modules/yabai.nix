
services.yabai = {
  enable = true;
  package = pkgs.yabai;
  enableScriptingAddition = true;

  extraConfig = ''
    # --- Focus follows mouse ---
    yabai -m config focus_follows_mouse autofocus
    yabai -m config mouse_follows_focus on
    yabai -m config mouse_modifier fn

    yabai -m config mouse_action1 move
    yabai -m config mouse_action2 resize
  '';
};
