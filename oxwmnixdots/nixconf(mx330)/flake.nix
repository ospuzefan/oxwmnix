{
  description = "mitty on nix, btw";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
     zen-browser = {
     url = "github:youwen5/zen-browser-flake";
     inputs.nixpkgs.follows = "nixpkgs";
     };

      swindle = {
        url = "github:kantiankant/swindle";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      sb = {
        url = "github:kantiankant/sb";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      termipedia = {
        url = "github:kantiankant/termipedia";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      m701 = {
         url = "github:kantiankant/m701";
         inputs.nixpkgs.follows = "nixpkgs";
       };

      make2flake = {
        url = "github:kantiankant/make2flake";
        inputs.nixpkgs.follows = "nixpkgs";
       };


  };

  outputs = { self, nixpkgs, zen-browser, make2flake, m701, termipedia, sb, home-manager, swindle, ... }@inputs: {

  nixosConfigurations.mitty-btw = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [ ./configuration.nix 
    (
     { pkgs, ... }:
     {
       environment.systemPackages = [
       ];
     }
    )
    ];
    specialArgs = { inherit inputs; };
       };
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}	
