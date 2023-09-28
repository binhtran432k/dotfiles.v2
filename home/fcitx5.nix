{ pkgs, ... }:
let
  package = pkgs.fcitx5-with-addons.override {
    addons = [ pkgs.fcitx5-unikey ];
  };

  gtk2Cache =
    pkgs.runCommandLocal "gtk2-immodule.cache"
      {
        buildInputs = [ pkgs.gtk2 package ];
      } ''
      mkdir -p $out/etc/gtk-2.0/
      GTK_PATH=${package}/lib/gtk-2.0/ \
        gtk-query-immodules-2.0 > $out/etc/gtk-2.0/immodules.cache
    '';

  gtk3Cache =
    pkgs.runCommandLocal "gtk3-immodule.cache"
      {
        buildInputs = [ pkgs.gtk3 package ];
      } ''
      mkdir -p $out/etc/gtk-3.0/
      GTK_PATH=${package}/lib/gtk-3.0/ \
        gtk-query-immodules-3.0 > $out/etc/gtk-3.0/immodules.cache
    '';
in
{
  home.sessionVariables = {
    GLFW_IM_MODULE = "ibus"; # IME support in kitty
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
  home.packages = [ package gtk2Cache gtk3Cache ];
}
