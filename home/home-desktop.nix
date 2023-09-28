{ user, ... }: {
  imports = [
    ./home-server.nix

    ./development.nix
    ./media.nix
    ./shell-desktop.nix

    ./cursor.nix
    ./creative.nix
    ./dunst.nix
    ./fcitx5.nix
    ./flameshot.nix
    ./gtk.nix
    ./kitty.nix
    ./neovim.nix
    ./vimiv.nix
    ./xdg.nix
    ./zathura.nix
  ];

  home.file.".background-image".source = user.wallpaper;
}
