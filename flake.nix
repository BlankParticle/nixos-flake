{
  description = "BlankParticle's Ultimate NixOS Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs:
    {
      nixosConfigurations = {
        north-star = import ./systems/north-star { inherit inputs; };
      };
    };
}
