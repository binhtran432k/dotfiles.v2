{ user, ... }: {
  programs.kitty = {
    enable = true;
    theme = user.colorscheme.kitty-theme;
    settings = {
      background_opacity = "0.9";
    };
  };
}
