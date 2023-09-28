{ pkgs, ... }: {
  fonts.fontconfig.enable = true;

  systemd.user.sessionVariables = {
    "NIXOS_OZONE_WL" = "1"; # for any ozone-based browser & electron apps to run on wayland
    "MOZ_ENABLE_WAYLAND" = "1"; # for firefox to run on wayland
    "MOZ_WEBRENDER" = "1";
    # "LIBVA_DRIVER_NAME" = "nvidia";
    # "GBM_BACKEND" = "nvidia-drm";
    # "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";

    # for hyprland with nvidia gpu, ref https://wiki.hyprland.org/Nvidia/
    "XDG_SESSION_TYPE" = "wayland";
    "WLR_NO_HARDWARE_CURSORS" = "1";
    "WLR_EGL_NO_MODIFIRES" = "1";
  };
}
