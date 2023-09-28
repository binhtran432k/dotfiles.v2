{ pkgs
, mypkgs
, ...
}: {
  environment.sessionVariables = {
    STARDICT_DATA_DIR = "${mypkgs.stardict-dictionaries}/share/stardict";
    SDCV_PAGER = "bat";
  };

  environment.systemPackages = with pkgs; [
    sdcv
  ];
}
