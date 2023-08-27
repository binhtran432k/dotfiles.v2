{ ... }:
{
  imports = [
    ../server

    ./neovim.nix
    ./terminal.nix
    ./development.nix
    ./media.nix
  ];
}
