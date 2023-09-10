{ ... }:
{
  imports = [
    ./shell-server.nix

    ./bat.nix
    ./core.nix
    ./git.nix
    ./macchina.nix
    ./zellij.nix
  ];
}
