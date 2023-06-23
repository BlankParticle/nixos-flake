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

  outputs = imported-modules:
    let
      username = "blank";
    in
    {
      nixosConfigurations = (
        import ./nixos {
          inherit imported-modules username;
          system = "x86_64-linux";
        }
      );
    };
}
