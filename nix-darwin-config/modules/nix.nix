{ config, lib, pkgs, ... }:
{
  # Use Determinate's Nix, don't let nix-darwin manage it
  nix.enable = false;

  # If/when you uninstall Determinate and want nix-darwin to own Nix:
  # - remove the line above
  # - uncomment the settings below

  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
}

