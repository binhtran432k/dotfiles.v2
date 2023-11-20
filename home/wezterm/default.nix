{ config
, ...
}: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return require("config")
    '';
  };

  home.file = {
    ".config/wezterm/config".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/home/wezterm/config";
  };
}
