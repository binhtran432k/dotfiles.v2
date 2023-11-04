{ pkgs, ... }:
{
  programs.lf = {
    enable = false;
    commands = {
      dragon = "%dragon $fx";
      z = ''
        %{{
          result="$(zoxide query --exclude $PWD $@ | sed 's/\\/\\\\/g;s/"/\\"/g')"
          lf -remote "send $id cd \"$result\""
        }}
      '';
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
          *) bat --color=always "$1";;
        esac
      '';
    };
    keybindings = { };
  };
}
