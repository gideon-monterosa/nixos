{
  description = "Gideon's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    # nix-darwin = {
    #   url = "github:nix-darwin/nix-darwin/master";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # quickshell = {
    #   url = "github:outfoxxed/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # elephant.url = "github:abenz1267/elephant";
    # walker = {
    #   url = "github:abenz1267/walker";
    #   inputs.elephant.follows = "elephant";
    # };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # firefox-addons = {
    #   url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    nvf = {
      url = "github:gideon-monterosa/nvf/v0.8";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/t14s/configuration.nix
        inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14s
        inputs.stylix.nixosModules.stylix
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
              inputs.nvf.homeManagerModules.default
              ./hosts/t14s/home.nix
            ];
          };
        }
      ];
    };

    # darwinConfigurations."Gideons-MacBook-Pro" = nix-darwin.lib.darwinSystem {
    #   system = "x86_64-darwin";
    #   modules = [
    #     ./hosts/macbook/configuration.nix
    #     inputs.nix-homebrew.darwinModules.nix-homebrew
    #     {
    #       nix-homebrew = {
    #         enable = true;
    #         user = "gideon";
    #       };
    #     }
    #     home-manager.darwinModules.home-manager
    #     {
    #       home-manager = {
    #         useGlobalPkgs = true;
    #         useUserPackages = true;
    #
    #         extraSpecialArgs = {
    #           inherit inputs;
    #         };
    #
    #         users.gideon.imports = [
    #           inputs.nvf.homeManagerModules.default
    #           ./hosts/macbook/home.nix
    #         ];
    #       };
    #     }
    #   ];
    # };
  };
}
