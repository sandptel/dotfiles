{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    homeManager={
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };
     catppuccin.url = "github:catppuccin/nix";  
     auto-cpufreq = {
            url = "github:AdnanHodzic/auto-cpufreq";
            inputs.nixpkgs.follows = "nixpkgs";
        };
  };

  outputs = { self,nixpkgs,home-manager, ... }@inputs: 
  let 
  system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations.roronoa = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit system inputs;};
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./packages.nix
        inputs.catppuccin.nixosModules.catppuccin
        inputs.auto-cpufreq.nixosModules.default
      ];
    };
#remains unused for now can be accessed using home-manager switch
    homeConfigurations.roronoa = home-manager.lib.homeManagerConfiguration{
      inherit pkgs;
      extraSpecialArgs = {inherit system inputs;};
      modules=[
        ./home-manager/home.nix
        inputs.catppuccin.homeManagerModules.catppuccin
      ];
    };
    
  };
}
