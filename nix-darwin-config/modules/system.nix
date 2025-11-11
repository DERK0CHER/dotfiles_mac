{ config, pkgs, ... }:
{
  # Example: shells, fonts, services, etc. Put generic system tweaks here.

  # programs.fish.enable = true;
   fonts.packages = with pkgs; [ jetbrains-mono ];

system.stateVersion = 6;
}

