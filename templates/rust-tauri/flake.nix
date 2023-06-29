{
  description = "Rust, Cargo and Tauri Project";

  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        libraries = with pkgs;[
          webkitgtk
          gtk3
          cairo
          gdk-pixbuf
          glib
          dbus
          openssl_3
          librsvg
        ];

        packages = with pkgs; [
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
          cargo
          rustc
          rustfmt
          rustPackages.clippy
          rust-analyzer
          nodejs_20
          nodePackages_latest.pnpm
        ];
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = packages;
          RUST_SRC_PATH = pkgs.rustPlatform.rustLibSrc;
          shellHook =
            ''
              export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath libraries}:$LD_LIBRARY_PATH
            '';
        };
      });
}
