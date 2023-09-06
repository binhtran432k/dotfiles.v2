{ pkgs, user, ... }:
{
  imports = [
    ./cursor.nix
    ./creative.nix
    ./dunst.nix
    ./gtk.nix
    ./kitty.nix
    ./media.nix
    ./xdg.nix
    ./xresource.nix
  ];
}
