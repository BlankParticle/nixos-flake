{ python3, fetchFromGitHub, gnome, stdenv }:
stdenv.mkDerivation rec {
  pname = "nautilus-open-in-blackbox";
  version = "0.1.1";

  src = fetchFromGitHub
    {
      owner = "ppvan";
      repo = pname;
      rev = version;
      hash = "sha256-5rvh3qNalpjamcBVQrnAW6GxhwPPlRxP5h045YDqvrM=";
    };

  patches = [ ./paths.patch ];

  buildInputs = [
    gnome.nautilus-python
    python3.pkgs.pygobject3
  ];

  installPhase = ''
    mkdir -p $out/share/nautilus-python/extensions
    cp ./nautilus-open-in-blackbox.py $out/share/nautilus-python/extensions
  '';
}
