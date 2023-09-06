{ pkgs, ... }:
{
  # Linux Only Packages, not available on Darwin
  home.packages = with pkgs; [
    pciutils # lspci
    usbutils # lsusb
  ];

  # auto mount usb drives
  services.udiskie.enable = true;
}
