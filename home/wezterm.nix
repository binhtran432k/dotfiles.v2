{ config
, ...
}: {
  programs.wezterm = {
    enable = true;
  };

  home.file = {
    ".wezterm.lua".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/wezterm.lua";
  };
}
