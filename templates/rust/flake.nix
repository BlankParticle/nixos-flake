{
  description = "Rust and Cargo Project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, rust-overlay }:
    let
      system = "x86_64-linux";
      overlays = [ (import rust-overlay) ];

      pkgs = import nixpkgs {
        inherit system overlays;
      };

      packages = with pkgs; [
        rust-bin.stable.latest.default
        rust-analyzer
        nil
        nixpkgs-fmt
      ];
    in
    {
      devShells.${system}.default =
        pkgs.mkShell {
          inherit packages;
          RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
        };
    };
}
