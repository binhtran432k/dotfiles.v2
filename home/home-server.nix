{ ... }: {
  imports = [
    ./shell-server.nix

    ./bat.nix
    ./eza.nix
    ./lf.nix
    ./yazi.nix
    ./lazygit.nix
    ./ripgrep.nix
    ./core.nix
    ./git.nix
    ./macchina.nix
    ./zellij.nix
    ./zoxide.nix
  ];
}
