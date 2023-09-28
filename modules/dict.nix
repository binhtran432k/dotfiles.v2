{ pkgs
, mypkgs
, ...
}: {
  services.dictd = {
    enable = true;
    DBs = with pkgs.dictdDBs;
      with mypkgs.dictdDBs; [
        eng2vie
        wordnet
      ];
  };
}
