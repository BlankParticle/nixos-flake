# This flake is for future ref to use prisma with nix
{
  description = "NodeJS current, pnpm and prisma Project";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      packages = with pkgs; [
        (nodejs_20.override { enableNpm = false; })
        nodePackages_latest.pnpm
        nodePackages_latest.prisma
        nil
        nixpkgs-fmt
      ];
    in
    {
      devShells.${system}.default =
        pkgs.mkShell {
          inherit packages;
          shellHook = with pkgs; ''
            export PRISMA_MIGRATION_ENGINE_BINARY="${prisma-engines}/bin/migration-engine"
            export PRISMA_QUERY_ENGINE_BINARY="${prisma-engines}/bin/query-engine"
            export PRISMA_QUERY_ENGINE_LIBRARY="${prisma-engines}/lib/libquery_engine.node"
            export PRISMA_INTROSPECTION_ENGINE_BINARY="${prisma-engines}/bin/introspection-engine"
            export PRISMA_FMT_BINARY="${prisma-engines}/bin/prisma-fmt"
          '';
        };
    };
}
