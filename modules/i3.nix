{ pkgs, user, ... }:
{
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
          greeters.gtk = {
            enable = true;
            cursorTheme = {
              inherit (user.cursor) package name size;
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
