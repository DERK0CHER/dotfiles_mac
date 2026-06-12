{ config, pkgs, ... }:
{
  # Integrate home-manager into nix-darwin (applied during darwin-rebuild).
  users.users.beba.home = "/Users/beba";

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.beba = { pkgs, ... }: {
    home.stateVersion = "25.05";

    # Syncthing: installs the package and runs it as a launchd user agent.
    services.syncthing = {
      enable = true;

      # Keep `false` so devices/folders you add later in the web UI
      # (http://127.0.0.1:8384) survive future rebuilds.
      overrideDevices = false;
      overrideFolders = false;

      settings.folders."Documents" = {
        id = "documents";
        path = "/Users/beba/Documents";
      };
    };
  };
}
