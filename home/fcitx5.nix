{ pkgs, ... }:
{
  home.sessionVariables = {
    GLFW_IM_MODULE = "ibus"; # IME support in kitty
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
  home.packages = with pkgs; [
    (fcitx5-with-addons.override {
      addons = [ fcitx5-unikey ];
    })
  ];
}
