{ ... }:
{
  imports = [
    ./home-linux.nix
    ./home-desktop.nix

    ./i3
    ./i3status-rust.nix
    ./rofi.nix
    ./picom.nix
    ./xresource.nix
    ./betterlockscreen.nix
  ];
}
