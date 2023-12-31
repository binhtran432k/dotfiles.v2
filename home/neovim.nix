{ config
, pkgs
, ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.file = {
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
  };

  home.packages = with pkgs; [
    gnumake # Makefile

    # c/c++
    clang-tools
    gcc

    # python
    nodePackages.pyright
    ruff-lsp
    isort
    black

    #-- rust
    rust-analyzer
    rustfmt

    #-- zig
    # zls

    #-- nix
    nil

    #-- lua
    lua-language-server
    stylua

    #-- typst
    typst-lsp
    typstfmt

    #-- javascript/typescript
    # HTML/CSS/JSON/ESLINT language server extracted from vscode
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server

    #-- other
    taplo # TOML language server / formatter / validator
    nodePackages.yaml-language-server
    marksman # language server for markdown
    nodePackages.markdownlint-cli
    emmet-language-server

    #-- misc
    tree-sitter # use to compile tree-sitter parser
    nodePackages.prettier # common code formatter
    nodePackages.live-server
  ];
}
