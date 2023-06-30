{
  description = "BlankParticle's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify.url = "github:the-argus/spicetify-nix";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = imported-modules:
    let
      username = "blank";
      lib = imported-modules.nixpkgs.lib;
    in
    lib.foldl' lib.recursiveUpdate { } [
      {
        nixosConfigurations = (
          import ./nixos {
            inherit imported-modules username;
            system = "x86_64-linux";
          }
        );
        templates = import ./templates;
      }
      (imported-modules.flake-utils.lib.eachDefaultSystem (system: (
        let
          pkgs = imported-modules.nixpkgs.legacyPackages.${system};
        in
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs;[
              nil
              nixpkgs-fmt
            ];
          };
        }
      )))
    ];
}
