{ ... }:
let
  yazi-simple = ''
    [manager]
    syntect_theme = "~/.config/bat/themes/custom.tmTheme"
    [status]
    separator_open  = ""
    separator_close = ""
  '';
in
{
  home.file.".config/yazi/theme.toml".text = yazi-simple;

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
}
