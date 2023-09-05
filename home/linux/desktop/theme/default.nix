{ pkgs, user, ... }:
{
  imports = [
    ./gtk.nix
  ];

  home.pointerCursor = {
    inherit (user.cursor) package name size;
    gtk.enable = true;
    x11.enable = true;
  };

  # set dpi for 4k monitor
  # xresources.properties = {
  #   # dpi for Xorg's font
  #   "Xft.dpi" = 162;
  #   # or set a generic dpi
  #   "*.dpi" = 162;
  # };
}
