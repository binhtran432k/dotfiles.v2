{ lib
, pkgs
, stdenv
, fetchurl
, ...
}:
stdenv.mkDerivation rec {
  name = "stardict-dictionaries";
  src = fetchurl {
    url = "https://github.com/binhtran432k/dotfiles/releases/download/resource/stardict-vietnamese.tar.gz";
    sha256 = "f3c18335c4e768ad48599f38e282a2634e92d7739ce38688b01772893c7d5e16";
  };
  dontBuild = true;
  unpackPhase = ''
    tar xf ${src}
  '';
  installPhase = ''
    mkdir -p $out/share/stardict/dic
    cp -r ./*/* $out/share/stardict/dic
  '';

  meta = {
    description = "dictionaries for stardict";
    platforms = lib.platforms.linux;
  };
}
