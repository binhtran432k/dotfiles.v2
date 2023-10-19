{ pkgs
, mypkgs
, ...
}: {
  home.packages = with pkgs; [
    gnumake # Makefile
    jdk17 # run *.jar programs
    python3 # for fast script
    nodejs_18
    bun
    cargo
    exercism

    # database related
    # dbeaver # database viewer
    # mycli # mysql
    # pgcli # postgresql
  ];

  home.file = {
    ".npmrc".text = ''
      prefix=~/.npm-packages
    '';
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;

      enableBashIntegration = true;
    };
  };
}
