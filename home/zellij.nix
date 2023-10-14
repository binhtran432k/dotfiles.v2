{ user, ... }:
with user.colorscheme; {
  programs.zellij = {
    enable = true;
  };

  home.file.".config/zellij/config.kdl".text = ''
    simplified_ui true
    default_layout "compact"
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
      shared {
        unbind "Ctrl o"
        unbind "Ctrl g"
      }
      shared_except "locked" {
        bind "Alt 9" { SwitchToMode "locked"; }
      }
      locked {
        bind "Alt 9" { SwitchToMode "normal"; }
      }
      pane {
        bind "D" { Detach; }
      }
    }
  '';
}
