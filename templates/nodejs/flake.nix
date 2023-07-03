{
  description = "NodeJS current and pnpm Project";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      packages = with pkgs; [
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
