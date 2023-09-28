{ user, ... }:
with user.colorscheme; {
  programs.zellij = {
    enable = true;
  };

  home.file.".config/zellij/layouts/custom.kdl".text = ''
    layout {
      pane size=1 borderless=true {
        plugin location="zellij:compact-bar"
      }
      pane split_direction="vertical" {
        pane
      }
    }
  '';

  home.file.".config/zellij/config.kdl".text = ''
    simplified_ui true
    default_layout "custom"
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
        bind "Alt 1" { GoToTab 1; }
        bind "Alt 2" { GoToTab 2; }
        bind "Alt 3" { GoToTab 3; }
      }
      shared_except "locked" {
        bind "Alt N" { NewTab; SwitchToMode "normal"; }
        bind "Alt 9" { SwitchToMode "locked"; }
      }
      shared_except "session" "locked" {
        bind "Alt 0" { SwitchToMode "session"; }
      }
      locked {
        bind "Alt 9" { SwitchToMode "normal"; }
      }
      session {
        bind "Alt 0" { SwitchToMode "normal"; }
      }
    }
  '';
}
