{ ... }:
{
  imports = [
    ./home-server.nix


    ./development.nix
    ./media.nix

    ./cursor.nix
    ./creative.nix
    ./dunst.nix
    ./fcitx5.nix
    ./gtk.nix
    ./kitty.nix
    ./neovim.nix
    ./xdg.nix
    ./xresource.nix
  ];
}
