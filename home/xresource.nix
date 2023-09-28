{ ... }:
let
  dpi = 120;
in
{
  # set dpi for 4k monitor
  xresources.properties = {
    # dpi for Xorg's font
    "Xft.dpi" = dpi;
    # or set a generic dpi
    "*.dpi" = dpi;
  };
}
