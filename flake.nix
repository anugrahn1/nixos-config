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
    zen-browser.url = "github:MarceColl/zen-browser-flake";
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
        modules = [ ./configuration.nix ];
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
