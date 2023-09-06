{ ... }:
{
  imports = [
    ./zellij

    ./shell-server.nix
    ./bat.nix
    ./core.nix
    ./git.nix
  ];
}
