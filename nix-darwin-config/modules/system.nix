{ config, pkgs, ... }:
{
  # Example: shells, fonts, services, etc. Put generic system tweaks here.

   programs.fish.enable = true;
    environment.shells = [ pkgs.fish ];

 # Keyboard
   fonts.packages = with pkgs; [ iosevka jetbrains-mono ];
   system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

system.stateVersion = 6;
}

