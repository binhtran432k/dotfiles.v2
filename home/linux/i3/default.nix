{ config, pkgs, ... }:
{
  imports = [
    ./config.nix
  ];

  xsession.windowManager.i3.enable = true;

  programs.rofi = {
    enable = true;
  };

  services.dunst.enable = true;

  home.packages = with pkgs; [
    libnotify # notify-send
    xsel # clipboard support
  ];
}
