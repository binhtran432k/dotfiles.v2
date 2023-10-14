{ pkgs, ... }: {
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    #-- text processin
    gnugrep # grep/egrep/fgrep
    gnused # sed
    fd # search files
    xdragon # drag and drop from cli
    viu # image viewer from cli
    sad # cli search and replace

    #-- misc
    carapace # multi-command argument completer
    which
    tree
  ];
}
