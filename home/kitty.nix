{ user, ... }:
{
  programs.kitty = {
    enable = true;
    theme = user.colorscheme.kitty-theme;
  };
}
