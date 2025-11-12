{ config, pkgs, ... }:
{
  # Example: shells, fonts, services, etc. Put generic system tweaks here.

   programs.fish.enable = true;
    environment.shells = [ pkgs.fish ];

   fonts.packages = with pkgs; [ iosevka jetbrains-mono ];
   system.keyboard = {
    enableKeyMapping = true;

    # SimpleCapsLockSwap is one of the built-in presets
    remapCapsLockToEscape = true;
  };

system.stateVersion = 6;
}

