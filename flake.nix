{
  description = "Gideon's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    elephant.url = "github:abenz1267/elephant";
    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    nvf.url = "github:notashelf/nvf/v0.8";
  };

  outputs = {
    nixpkgs,
    nix-darwin,
    nix-homebrew,
    home-manager,
    nvf,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/nixos-desktop/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = {
              inherit inputs;
              assets = {
                wallpaper = ./assets/wallpaper.jpg;
              };
            };

            users.gideon.imports = [
              nvf.homeManagerModules.default
              ./hosts/nixos-desktop/home.nix
            ];
          };
        }
      ];
    };

    darwinConfigurations."Gideons-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [
        ./hosts/macbook/configuration.nix
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            user = "gideon";
          };
        }
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = {
              inherit inputs;
              assets = {
                wallpaper = ./assets/wallpaper.jpg;
              };
            };

            users.gideon.imports = [
              ./hosts/macbook/home.nix
            ];
          };
        }
      ];
    };
  };
}
