{
  description = "nix-darwin config (modular)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, ... }: {
    darwinConfigurations.be = nix-darwin.lib.darwinSystem {
      # Target system (Apple Silicon)
      system = "aarch64-darwin";

      modules = [
        ./modules/nix.nix
        ./modules/packages.nix
        ./modules/system.nix
        # ./modules/services/yabai.nix  # later if you want
      ];
    };
  };
}

