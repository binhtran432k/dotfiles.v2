{ pkgs, ... }:
{
  imports = [
    ./theme
    ./creative.nix
    ./media.nix
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    zathura # pdf viewer
    vimiv-qt # image viewer
    flameshot # screen capture
  ];
}
