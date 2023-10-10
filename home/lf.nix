{ pkgs, }:
{
  programs.lf = {
    enable = true;
    commands = {
    };
    previewer = {
      keybinding = "i";
      source = pkgs.writeShellScript "pv.sh" ''
        #!/bin/sh

        case "$1" in
          *.tar*) tar tf "$1";;
          *.zip) unzip -l "$1";;
          *.rar) unrar l "$1";;
          *.7z) 7z l "$1";;
          *) bat "$1";;
        esac
      '';
    };
    keybindings = {
    };
  };
}
