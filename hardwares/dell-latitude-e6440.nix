{ lib, nixos-hardware, ... }:
with nixos-hardware.nixosModules;
{
  imports = [
    common-pc-laptop
    common-pc-laptop-ssd
    common-cpu-intel
  ];

  # Essential Firmware
  hardware.enableRedistributableFirmware = lib.mkDefault true;

  # Cooling Management
  services.thermald.enable = lib.mkDefault true;
}
