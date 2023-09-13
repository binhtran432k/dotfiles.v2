{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnumake # Makefile
    jdk17 # run *.jar programs
    python3 # for fast script
    bun # for some global package

    # database related
    # dbeaver # database viewer
    # mycli # mysql
    # pgcli # postgresql
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;

      enableBashIntegration = true;
    };
  };
}
