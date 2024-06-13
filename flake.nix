{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nix-colors.url= "github:misterio77/nix-colors";
    catppuccin.url = "github:catppuccin/nix";
    nixvim.url = "github:nix-community/nixvim";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{catppuccin,nix-colors, nixvim,nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      roronoa = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs={inherit nix-colors;};
        modules = [
          catppuccin.nixosModules.catppuccin
          {
          catppuccin.enable= true;
          catppuccin.flavor = "mocha";
          }
          ./configuration.nix
          ./packages.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
          {
          home-manager.users.roronoa = {
            imports= [
              inputs.nix-colors.homeManagerModules.default
                        ./home-manager/home.nix
              catppuccin.homeManagerModules.catppuccin
            ];
          };
        }
        ];
      };
    };
  };
}
