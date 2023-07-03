{
  description = "Rust and Cargo Project";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      packages = with pkgs; [
        cargo
        rustc
        rustfmt
        rustPackages.clippy
        rust-analyzer
        nil
        nixpkgs-fmt
      ];
    in
    {
      devShells.${system}.default =
        pkgs.mkShell {
          inherit packages;
          RUST_SRC_PATH = pkgs.rustPlatform.rustLibSrc;
        };
    };
}
