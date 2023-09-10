{ user, ... }:

with user.colorscheme;

{
  programs.zellij = {
    enable = true;
  };

  home.file.".config/zellij/config.kdl".text = ''
    theme "custom"
    themes {
      custom {
        fg "${foreground}"
        bg "${background}"
        black "${dark}"
        red "${danger}"
        green "${success}"
        yellow "${warning}"
        blue "${primary}"
        magenta "${secondary}"
        cyan "${info}"
        white "${light}"
        orange "${tertiary}"
      }
    }
    keybinds {
      normal {
        unbind "Ctrl o"
        bind "Ctrl g" { SwitchToMode "session"; }
      }
      session {
        bind "l" { SwitchToMode "locked"; }
      }
    }
  '';
}
