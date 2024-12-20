{
  description = "My first flake!";

  inputs = {
    # nixpkgs = {
    #   url = "github:NixOS/nixpkgs/nixos-unstable";
    # };

    nixpkgs.url = "nixpkgs/nixos-unstable"; # Short hand for above
    home-manager.url = "github:nix-community/home-manager/master"; # Unstable branch
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # ags.url = "github:Aylur/ags";
    # ags.inputs.nixpkgs.follows = "nixpkgs";
    # zen-browser.url = "github:MarceColl/zen-browser-flake?rev=5fce6f9bc9b2bda1f0281fcbef3160903ddc5882";
    zen-browser.url = "github:omarcresp/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    stylix.inputs = {
      home-manager.follows = "home-manager";
    };
    catppuccin.url = "github:catppuccin/nix";
    # picom.url = "github:yshui/picom";
    fabric.url = "github:Fabric-Development/fabric";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs"; # MESA/OpenGL HW workaround
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      hyprland,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          }; # allows inputs to be used in configuration.nix
          modules = [
            ./configuration.nix
            inputs.stylix.nixosModules.stylix
          ];
        };
      };
      homeConfigurations = {
        anugrah = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit inputs;
          }; # allows inputs to be used in home.nix
          modules = [
            ./home.nix
            inputs.catppuccin.homeManagerModules.catppuccin
            # inputs.picom.homeManagerModules.picom
            {
              wayland.windowManager.hyprland = {
                enable = true;
                package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
              };
            }
          ];
        };
      };
    };
}
