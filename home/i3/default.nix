{ pkgs, ... }: {
  imports = [
    ./config.nix
    ./theme.nix
  ];

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      startup = [
        { command = "xss-lock -- betterlockscreen -l dim"; }
        {
          command =
            "xidlehook --not-when-audio --not-when-fullscreen"
            + " --timer 600 'loginctl lock-session' ''"
            + " --timer 600 'systemctl suspend' ''";
        }
        { command = "flameshot"; }
        { command = "fcitx5 -dr"; }
        { command = "picom -b"; }
        { command = "safeeyes"; }
      ];
    };
  };

  home.packages = with pkgs; [
    xss-lock
    xidlehook
    libnotify # notify-send
    xsel # clipboard support
  ];
}
