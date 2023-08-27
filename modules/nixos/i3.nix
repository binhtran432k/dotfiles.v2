{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };

      displayManager = {
        defaultSession = "none+i3";
        lightdm.enable = true;
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
