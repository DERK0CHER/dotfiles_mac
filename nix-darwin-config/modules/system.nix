{ config, pkgs, ... }:
{
  # Example: shells, fonts, services, etc. Put generic system tweaks here.

   programs.fish.enable = true;
    environment.shells = [ pkgs.fish ];

nixpkgs.config.packageOverrides = pkgs: {
  spotify = pkgs.spotify.overrideAttrs (oldAttrs: rec {
    src = pkgs.fetchurl {
      url = oldAttrs.src.url;
      sha256 = "0gwoptqLBJBM0qJQ+dGAZdCD6WXzDJEs0BfOxz7f2nQ=";
    };
  });
};
 # Keyboard
   fonts.packages = with pkgs; [ iosevka jetbrains-mono ];
   system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

system.stateVersion = 6;
}

