{
  description = "Rust, Cargo and Tauri Project";

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
        (rust-bin.stable.latest.default.override {
          extensions = [ "rust-src" "rust-analyzer" ];
        })
        curl
        wget
        pkg-config
        dbus
        openssl_3
        glib
        gtk3
        libsoup
        webkitgtk
        librsvg
        (nodejs_20.override { enableNpm = false; })
        nodePackages_latest.pnpm
        nil
        nixpkgs-fmt
      ];
    in
    {
      devShells.${system}.default =
        pkgs.mkShell {
          inherit packages;
        };
    };
}
