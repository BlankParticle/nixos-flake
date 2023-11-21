{ stdenv
, fetchFromGitHub
, flavor ? "mocha"
}:

assert builtins.any (f: flavor == f) [ "frappe" "latte" "macchiato" "mocha" ];

stdenv.mkDerivation {
  pname = "catppuccin-grub-theme";
  version = "unstable-2022-12-29";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "grub";
    rev = "803c5df0e83aba61668777bb96d90ab8f6847106";
    hash = "sha256-/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/
    cp -r $src/src/catppuccin-${flavor}-grub-theme/* $out/

    runHook postInstall
  '';
}
