{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ffmpeg-full

    imagemagick
    graphviz

    pavucontrol # audio control

    zoom-us
  ];

  programs = {
    mpv = {
      enable = true;
      scripts = [pkgs.mpvScripts.mpris];
    };
  };

  services = {
    # mpris media player
    playerctld.enable = true;
  };

  # browser
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
  };

  # mail client
  programs.thunderbird = {
    enable = true;
    profiles = {};
  };
}
