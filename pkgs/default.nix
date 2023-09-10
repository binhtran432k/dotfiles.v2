{ pkgs, ... }:
let
  args = {
    inherit pkgs;
    inherit (pkgs) fetchurl lib stdenv;
  };
in {
  dictdDBs = import ./dictd-db.nix args;
  stardict-dictionaries = import ./stardict-dictionaries.nix args;
}
