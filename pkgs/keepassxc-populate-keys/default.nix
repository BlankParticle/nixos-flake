{ stdenv, keepassxc, curl, gnupg }:
stdenv.mkDerivation {
  pname = "keepassxc-populate-keys";
  version = "0.1.0";
  src = ./.;
  buildInputs = [ keepassxc curl gnupg ];
  installPhase = ''
    mkdir -p $out/bin
    cp $src/populate-keys.sh $out/bin/keepassxc-populate-keys
    chmod +x $out/bin/keepassxc-populate-keys
  '';
}
