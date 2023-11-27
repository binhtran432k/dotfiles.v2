{ pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  # for gtk 2 support
  home.packages = with pkgs; [
    gnome3.gnome-themes-extra
  ];
}
