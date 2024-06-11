{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    catppuccin.url = "github:catppuccin/nix";
    nixvim.url = "github:nix-community/nixvim";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{catppuccin, nixvim,nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      # TODO please change the hostname to your own
      roronoa = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        
        modules = [
          catppuccin.nixosModules.catppuccin
          {
          catppuccin.enable= true;
          catppuccin.flavor = "mocha";
          }
          ./configuration.nix
          ./packages.nix
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`	
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
          {
          # if you use home-manager
          home-manager.users.roronoa = {
            imports = [
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
