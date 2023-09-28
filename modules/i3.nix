{ pkgs
, user
, ...
}: {
  services = {
    xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };

      displayManager = {
        defaultSession = "none+i3";
        lightdm = {
          enable = true;
          background = user.wallpaper;
          greeters.gtk = {
            enable = true;
            cursorTheme = {
              inherit (user.cursor) package name size;
            };
            theme = {
              inherit (user.theme) package name;
            };
          };
        };
      };

      windowManager.i3 = {
        enable = true;
      };

      # Configure keymap in X11
      layout = "us";
      xkbVariant = "";

      # Touchpad
      libinput = {
        touchpad = {
          naturalScrolling = true;
          accelSpeed = "0.5";
        };
      };
    };
  };
}
