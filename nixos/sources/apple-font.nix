{ lib, stdenv, fetchurl, p7zip }:

stdenv.mkDerivation rec {
  pname = "apple-fonts";
  version = "1";

  pro = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
    sha256 = "19qa6fs6x5614sqw9a6idlizzsssw8256crz1ps2p2n6gwp2fvaq";
  };

  compact = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg";
    sha256 = "02127drlqvwscq6vaphmvsp85cn8j4zfhi0kb9a3fzc0z8b95hdq";
  };

  mono = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
    sha256 = "0vjdpl3xyxl2rmfrnjsxpxdizpdr4canqa1nm63s5d3djs01iad6";
  };

  ny = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/NY.dmg";
    sha256 = "1hgxyizpgam7y1xh36fsypd3a1nn417wdnnfk1zahq9vhxrrds2w";
  };

  nativeBuildInputs = [ p7zip ];

  sourceRoot = ".";

  dontUnpack = true;

  installPhase = ''
    7z x ${pro}
    cd SFProFonts 
    7z x 'SF Pro Fonts.pkg'
    7z x 'Payload~'
    mkdir -p $out/fontfiles
    mv Library/Fonts/* $out/fontfiles
    cd ..

    7z x ${mono}
    cd SFMonoFonts
    7z x 'SF Mono Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles
    cd ..

    7z x ${compact}
    cd SFCompactFonts
    7z x 'SF Compact Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles
    cd ..

    7z x ${ny}
    cd NYFonts
    7z x 'NY Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles

    mkdir -p $out/usr/share/fonts/OTF $out/usr/share/fonts/TTF
    mv $out/fontfiles/*.otf $out/usr/share/fonts/OTF
    mv $out/fontfiles/*.ttf $out/usr/share/fonts/TTF
    rm -rf $out/fontfiles
  '';

  meta = {
    description = "Apple San Francisco, New York fonts";
    homepage = "https://developer.apple.com/fonts/";
    license = lib.licenses.unfree;
  };
}
