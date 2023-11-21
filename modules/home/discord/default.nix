{ pkgs, ... }: {
  home.packages = [
    (pkgs.vesktop.overrideAttrs (_: prev: {
      pnpmDeps = prev.pnpmDeps.overrideAttrs (_: prev: {
        nativeBuildInputs = prev.nativeBuildInputs ++ [ pkgs.cacert ];
      });
    }))
  ];
}
