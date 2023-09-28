{ lib
, pkgs
, fetchurl
, stdenv
,
}:
let
  makeDictdDB = src: _name: _subdir: _locale:
    stdenv.mkDerivation {
      name = "dictd-db-${_name}";
      inherit src;
      locale = _locale;
      dbName = _name;
      dontBuild = true;
      unpackPhase = ''
        tar xf  ${src}
      '';
      installPhase = ''
        mkdir -p $out/share/dictd
        cp $(ls ./${_subdir}/*.{dict*,index} || true) $out/share/dictd
        echo "${_locale}" >$out/share/dictd/locale
      '';

      meta = {
        description = "dictd-db dictionary for dictd";
        platforms = lib.platforms.linux;
      };
    };
  makeDictdDBVietnamese = name: locale:
    makeDictdDB
      (fetchurl {
        url = "https://github.com/binhtran432k/dictd-vietnamese/archive/refs/tags/0.0.1.tar.gz";
        sha256 = "fc9c86e594c9c145b710fab4d3d7d814ea7bd91d83ab5e89c003c6198923657e";
      })
      name "dictd-vietnamese*/${name}"
      locale;
in
{
  eng2vie = makeDictdDBVietnamese "eng-vie" "en_US";
  vie2eng = makeDictdDBVietnamese "vie-eng" "vi_VN";
}
