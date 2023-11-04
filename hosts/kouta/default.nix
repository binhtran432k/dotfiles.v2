{ ... } @ args: {
  imports = [
    ./hard-disk-mount.nix
    ./hardware-configuration.nix

    ../../modules/core-desktop.nix
    ../../modules/user-group.nix

    ../../hardwares/dell-latitude-e6440.nix
  ];

  nixpkgs.overlays = import ../../overlays args;

  # Enable binfmt emulation of aarch64-linux, this is required for cross compilation.
  boot.binfmt.emulatedSystems = [ "aarch64-linux" "riscv64-linux" ];
  # supported fil systems, so we can mount any removable disks with these filesystems
  boot.supportedFilesystems = [
    "ext4"
    "btrfs"
    "xfs"
    #"zfs"
    "ntfs"
    "fat"
    "vfat"
    "exfat"
    "cifs" # mount windows share
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    systemd-boot.enable = true;
  };

  programs.git = {
    enable = true;
    config = {
      safe = {
        directory = "*";
      };
    };
  };

  networking = {
    hostName = "kouta";
    wireless.enable = false; # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    networkmanager.enable = true;

    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;
  };

  # for Nvidia GPU
  # services.xserver.videoDrivers = ["nvidia"]; # will install nvidia-vaapi-driver by default
  # hardware.nvidia = {
  #   # Optionally, you may need to select the appropriate driver version for your specific GPU.
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;

  #   # Modesetting is needed for most Wayland compositors
  #   modesetting.enable = true;
  #   # Use the open source version of the kernel module
  #   # Only available on driver 515.43.04+
  #   open = false;

  #   powerManagement.enable = true;
  # };
  # virtualisation.docker.enableNvidia = true; # for nvidia-docker

  hardware.opengl = {
    enable = true;
    # if hardware.opengl.driSupport is enabled, mesa is installed and provides Vulkan for supported hardware.
    driSupport = true;
    # needed by nvidia-docker
    driSupport32Bit = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
