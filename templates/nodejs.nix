{
  description = "NodeJS current and pnpm flake";

  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      rec {
        flakedPkgs = pkgs;
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            nodejs_20
            nodePackages_latest.pnpm
          ];
        };
      }
    );
}
