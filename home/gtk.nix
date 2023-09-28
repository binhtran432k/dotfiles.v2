{ config
, pkgs
, user
, ...
}:
let
  gtkCss = ./gtk.css;
in
{
  # gtk's theme settings, generate files:
  #   1. ~/.gtkrc-2.0
  #   2. ~/.config/gtk-3.0/settings.ini
  #   3. ~/.config/gtk-4.0/settings.ini
  gtk = {
    enable = true;

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      inherit (user.icon) package name;
    };

    theme = {
      inherit (user.theme) package name;
    };
  };

  xdg.configFile = {
    "gtk-3.0/gtk.css".source = gtkCss;
    "gtk-4.0/gtk.css".source = gtkCss;
  };
}
