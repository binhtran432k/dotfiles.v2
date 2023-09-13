{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nodejs_16
    ];
  };

  home.file = {
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
  };

  home.packages = with pkgs; [
    gnumake # Makefile

    # c/c++
    ccls
    gcc

    #-- rust
    rust-analyzer
    cargo

    #-- zig
    zls

    #-- nix
    nixd

    #-- lua
    lua-language-server

    #-- javascript/typescript
    nodePackages.typescript
    # HTML/CSS/JSON/ESLINT language server extracted from vscode
    nodePackages.vscode-langservers-extracted

    #-- other
    taplo # TOML language server / formatter / validator
    nodePackages.yaml-language-server
    marksman # language server for markdown

    #-- misc
    tree-sitter # use to compile tree-sitter parser
    nodePackages.prettier # common code formatter
    ripgrep # fast search tool
  ];
}