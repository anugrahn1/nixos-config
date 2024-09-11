{
  description = "My first flake!";

  inputs = {
    # nixpkgs = {
    #   url = "github:NixOS/nixpkgs/nixos-unstable";
    # };

    nixpkgs.url = "nixpkgs/nixos-unstable"; # Short hand for above
    home-manager.url = "github:nix-community/home-manager/master"; # Unstable branch
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    ags.url = "github:Aylur/ags";
    ags.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:MarceColl/zen-browser-flake?rev=5fce6f9bc9b2bda1f0281fcbef3160903ddc5882";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    stylix.inputs = {
      home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; }; # allows inputs to be used in configuration.nix
        modules = [
          ./configuration.nix
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
    homeConfigurations = {
        anugrah = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = { inherit inputs; }; # allows inputs to be used in home.nix
          modules = [ ./home.nix ];
        };
    };
  };
}
