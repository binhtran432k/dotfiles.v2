{ user, ... }:
with user.colorscheme; {
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
          {
            block = "net";
          }
          {
            alert = 10.0;
            block = "disk_space";
            info_type = "available";
            interval = 60;
            path = "/";
            warning = 20.0;
          }
          {
            block = "memory";
            format = " $icon $mem_used_percents ";
            format_alt = " $icon $swap_used_percents ";
          }
          {
            block = "backlight";
            invert_icons = true;
            cycle = [ 30 80 ];
          }
          {
            block = "cpu";
            interval = 1;
          }
          {
            block = "load";
            format = " $icon $1m ";
            interval = 1;
          }
          {
            block = "sound";
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
            interval = 60;
          }
        ];
        settings = {
          theme = {
            overrides = {
              idle_bg = background;
              idle_fg = foreground;
              info_bg = background;
              info_fg = info;
              good_bg = background;
              good_fg = success;
              warning_bg = background;
              warning_fg = warning;
              critical_bg = background;
              critical_fg = danger;
              separator = "|";
              separator_bg = background;
              separator_fg = border;
            };
          };
        };
        theme = "plain";
        icons = "awesome6";
      };
    };
  };
}
