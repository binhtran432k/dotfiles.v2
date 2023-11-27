{ user, ... }: {
  imports = [
    ./gtk
    ./wezterm

    ./home-server.nix

    ./development.nix
    ./media.nix
    ./shell-desktop.nix

    ./cursor.nix
    ./creative.nix
    ./dunst.nix
    ./fcitx5.nix
    ./flameshot.nix
    ./libreoffice.nix
    ./neovim.nix
    ./qt.nix
    ./safeeyes.nix
    ./vimiv.nix
    ./xdg.nix
    ./zathura.nix
  ];

  home.file.".background-image".source = user.wallpaper;
}
