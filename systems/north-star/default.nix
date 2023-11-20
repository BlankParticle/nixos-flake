{ inputs, ... }:
let
  metadata = {
    username = "blank";
    fullUsername = "Blank Particle";
    hostname = "NorthStar";
    system = "x86_64-linux";
  };
  pkgs = import inputs.nixpkgs {
    inherit (metadata) system;
    config.allowUnfree = true;
  };
  lib = inputs.nixpkgs.lib;
in
lib.nixosSystem {
  inherit (metadata) system;
  specialArgs = {
    inherit metadata pkgs inputs lib;
  };
  modules = [
    ./hardware.nix
    ./system.nix
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = {
        inherit pkgs inputs metadata;
      };
      home-manager.users.${metadata.username} = {
        imports = [ ./home.nix ];
      };
    }
  ];
}
