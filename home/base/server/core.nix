{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    #-- text processin
    gnugrep # grep/egrep/fgrep
    gnused # sed
    ripgrep # recursively search directories for a regex pattern
    sad # cli search and replace

    #-- misc
    carapace # multi-command argument completer
    which
    tree
  ];
}
