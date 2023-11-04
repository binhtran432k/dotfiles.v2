{ pkgs
, ...
}: {
  home.packages = with pkgs; [
    vscode
    gnumake # Makefile
    jdk17 # run *.jar programs
    nodejs_18
    nodePackages.pnpm
    typst
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
