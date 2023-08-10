{
  description = "BlankParticle's NixOS Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify.url = "github:the-argus/spicetify-nix";
  };
  outputs = { nixpkgs, ... } @ imported-modules:
    let
      username = "blank";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = (
        import ./nixos {
          inherit imported-modules username system pkgs;
        }
      );
      devShells.${system}.default =
        pkgs.mkShell {
          packages = with pkgs; [
            nil
            nixpkgs-fmt
          ];
        };
      templates = import ./templates;
    };
}
