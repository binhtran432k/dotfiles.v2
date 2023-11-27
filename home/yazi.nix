{ ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    theme = {
      manager = {
        syntect_theme = "~/.config/bat/themes/custom.tmTheme";
      };
      status = {
        separator_open = "";
        separator_close = "";
      };
    };
    settings = {
      manager = {
        sort_by = "alphabetical";
        sort_reverse = false;
      };
    };
  };
}
