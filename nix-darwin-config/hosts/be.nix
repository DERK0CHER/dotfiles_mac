{ config, pkgs, ... }:
{
  networking.hostName = "be";

  system.primaryUser = "beba";

  # Track config version for nix-darwin (don’t touch randomly)
  system.stateVersion = 6;

  # If you want host-only overrides, put them here.
}

