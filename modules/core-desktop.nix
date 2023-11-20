{ config
, lib
, pkgs
, ...
}: {
  imports = [
    ./core-server.nix
    ./dict.nix
    ./cron.nix
    ./redshift.nix
    ./sdcv.nix
    ./cloudflare.nix
  ];

  # to install chrome, you need to enable unfree packages
  nixpkgs.config.allowUnfree = lib.mkForce true;

  # enable fish shell
  programs.fish.enable = true;

  # add user's shell into /etc/shells
  environment.shells = with pkgs; [
    bash
    fish
    nushell
  ];
  # set user's default shell system-wide
  users.defaultUserShell = pkgs.fish;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # python, some times I may need to use python with root permission.
    (python310.withPackages (
      ps:
        with ps; [
          tkinter
          ipython
          pandas
          requests
          pyquery
          pyyaml
        ]
    ))
    psmisc # killall/pstree/prtstat/fuser/...
    # colmena  # nixos's remote deployment tool
    pulseaudio # provides `pactl`, which is required by some apps(e.g. sonic-pi)
  ];

  programs = {
    # android development tools, this will install adb/fastboot and other android tools and udev rules
    # see https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/programs/adb.nix
    # adb.enable = true;
    # The OpenSSH agent remembers private keys for you
    # so that you don’t have to type in passphrases every time you make an SSH connection.
    # Use `ssh-add` to add a key to the agent.
    ssh.startAgent = true;
    # dconf is a low-level configuration system.
    dconf.enable = true;
  };

  # A key remapping daemon for linux.
  # https://github.com/rvaiya/keyd
  # services.keyd = {
  #   enable = true;
  #   settings = {
  #     main = {
  #       # overloads the capslock key to function as both escape (when tapped) and control (when held)
  #       capslock = "overload(control, esc)";
  #     };
  #   };
  # };

  # PipeWire is a new low-level multimedia framework.
  # It aims to offer capture and playback for both audio and video with minimal latency.
  # It support for PulseAudio-, JACK-, ALSA- and GStreamer-based applications.
  # PipeWire has a great bluetooth support, it can be a good alternative to PulseAudio.
  #     https://nixos.wiki/wiki/PipeWire
  services.pipewire = {
    enable = true;
    package = pkgs.pipewire;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    wireplumber.enable = true;
  };
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  # Remove sound.enable or turn it off if you had it set previously, it seems to cause conflicts with pipewire
  sound.enable = false;
  # Disable pulseaudio, it conflicts with pipewire too.
  hardware.pulseaudio.enable = false;

  # enable bluetooth & gui paring tools - blueman
  # or you can use cli:
  # $ bluetoothctl
  # [bluetooth] # power on
  # [bluetooth] # agent on
  # [bluetooth] # default-agent
  # [bluetooth] # scan on
  # ...put device in pairing mode and wait [hex-address] to appear here...
  # [bluetooth] # pair [hex-address]
  # [bluetooth] # connect [hex-address]
  # Bluetooth devices automatically connect with bluetoothctl as well:
  # [bluetooth] # trust [hex-address]
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # security with polkit
  services.power-profiles-daemon = {
    enable = true;
  };
  security.polkit.enable = true;
  # security with gnome-kering
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    # https://flatpak.org/setup/NixOS
    # flatpak.enable = true;

    dbus.packages = [ pkgs.gcr ];
    geoclue2.enable = true;

    udev.packages = with pkgs; [
      gnome.gnome-settings-daemon
      # platformio # udev rules for platformio
      # openocd # required by paltformio, see https://github.com/NixOS/nixpkgs/issues/224895
      # android-udev-rules
    ];
  };

  xdg.portal = {
    enable = true;
    # Sets environment variable NIXOS_XDG_OPEN_USE_PORTAL to 1
    # This will make xdg-open use the portal to open programs,
    # which resolves bugs involving programs opening inside FHS envs or with unexpected env vars set from wrappers.
    # xdg-open is used by almost all programs to open a unknown file/uri
    # alacritty as an example, it use xdg-open as default, but you can also custom this behavior
    # and vscode has open like `External Uri Openers`
    xdgOpenUsePortal = false;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # for gtk
      # xdg-desktop-portal-kde  # for kde
    ];
  };

  # all fonts are linked to /nix/var/nix/profiles/system/sw/share/X11/fonts
  fonts = {
    fontDir.enable = true;

    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome

      # Microsoft fonts
      corefonts
      vistafonts

      # desktop fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      noto-fonts-extra

      # code fonts
      cascadia-code
      monaspace

      # nerdfonts
      nerdfonts
      # (nerdfonts.override {
      #   fonts = [
      #     "FiraCode"
      #     "JetBrainsMono"
      #     "Iosevka"
      #   ];
      # })
    ];

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "Cascadia Code" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  environment.variables = {
    # fix https://github.com/NixOS/nixpkgs/issues/238025
    TZ = "${config.time.timeZone}";
  };

  # Plymouth
  boot = {
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      # "i915.fastboot=1"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    plymouth.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;
  };
}
