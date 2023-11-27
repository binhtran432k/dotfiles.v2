{ config
, user
, pkgs
, ...
}:
let
  cfg = config.xsession.windowManager.i3.config;
  modifier = cfg.modifier;
  commands = {
    dict = "wezterm start --class floatsdcv sdcv";
    calc = "=";
    notify = msg: "notify-send '${msg}' -t 1500";
    lock = "loginctl lock-session";
    power-menu = "rofi -show power-menu -modi power-menu:rofi-power-menu";
    volume = {
      increase = "mycontrol volume up 10";
      decrease = "mycontrol volume down 10";
      mute = "mycontrol volume mute";
      mute-mic = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
    };
    brightness = {
      # increase = "mycontrol brightness up 10";
      # decrease = "mycontrol brightness down 10";
      # Because of actkbd already use it
      increase = "mycontrol brightness get";
      decrease = "mycontrol brightness get";
    };
    screenshot = {
      full = "flameshot full --clipboard";
      rect = "flameshot gui";
    };
  };
  mycontrol = pkgs.writeShellScriptBin "mycontrol" (builtins.readFile ./mycontrol);
in
{
  home.packages = [
    mycontrol
  ];

  xsession.windowManager.i3 = {
    config = {
      modifier = "Mod4";
      terminal = user.terminal-app;
      menu = "rofi -show run";
      fonts = {
        names = [ "Noto Sans Mono" "FontAwesome6Free" ];
        style = "Bold Semi-Condensed";
        size = 11.0;
      };
      defaultWorkspace = "workspace number 1";
      assigns = {
        "2" = [{ class = "^Brave-browser$"; }];
        "3" = [{ class = "^thunderbird$"; }];
      };
      floating = {
        titlebar = true;
        border = 1;
      };
      window = {
        titlebar = false;
        border = 1;
        commands = [
          {
            criteria = { class = "floating"; };
            command = "floating enable";
          }
          {
            criteria = { class = "floatsdcv"; };
            command = "floating enable, resize set 800 600, move position center";
          }
          {
            criteria = { urgent = "latest"; };
            command = "focus";
          }
        ];
      };
      gaps = {
        inner = 14;
        outer = -2;
        smartGaps = true;
        smartBorders = "on";
      };
      modes = {
        resize = {
          "Left" = "resize shrink width 10 px or 10 ppt";
          "Down" = "resize grow height 10 px or 10 ppt";
          "Up" = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 10 px or 10 ppt";
          "Ctrl+bracketleft" = "mode default";
          "Escape" = "mode default";
          "Return" = "mode default";
        };
        open = {
          "d" = "exec --no-startup-id ${commands.dict}, mode default";
          "b" = "exec --no-startup-id ${user.browser-app}, mode default";
          "m" = "exec --no-startup-id ${user.mail-app}, mode default";
          "c" = "exec --no-startup-id ${commands.calc}, mode default";
          "Ctrl+bracketleft" = "mode default";
          "Escape" = "mode default";
          "Return" = "mode default";
        };
      };
      bars = [
        (
          {
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs config-default.toml";
            position = "top";
            fonts = {
              names = [ "Noto Sans Mono" "FontAwesome6Free" ];
              style = "Bold Semi-Condensed";
              size = 11.0;
            };
          }
          // config.lib.theme.i3.bar
        )
      ];
      keybindings = {
        "${modifier}+Return" = "exec ${cfg.terminal}";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+d" = "exec ${cfg.menu}";

        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";

        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

        "${modifier}+f" = "fullscreen toggle";

        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+slash" = "layout toggle split";

        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+space" = "focus mode_toggle";

        "${modifier}+a" = "focus parent";

        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+minus" = "scratchpad show";

        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";

        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";

        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";
        "${modifier}+Shift+e" = "exec --no-startup-id ${commands.power-menu}";

        "${modifier}+r" = "exec --no-startup-id ${commands.notify "resize"}, mode resize";
        "${modifier}+o" = "exec --no-startup-id ${commands.notify "open: (b)rowser (m)ail (c)alc (d)ict"}, mode open";

        "Control+Mod1+l" = "exec --no-startup-id ${commands.lock}";

        "Control+Up" = "exec --no-startup-id ${commands.volume.increase}";
        "Control+Down" = "exec --no-startup-id ${commands.volume.decrease}";

        "XF86AudioRaiseVolume" = "exec --no-startup-id ${commands.volume.increase}";
        "XF86AudioLowerVolume" = "exec --no-startup-id ${commands.volume.decrease}";
        "XF86AudioMute" = "exec --no-startup-id ${commands.volume.mute}";
        "XF86AudioMicMute" = "exec --no-startup-id ${commands.volume.mute-mic}";

        "XF86MonBrightnessUp" = "exec --no-startup-id ${commands.brightness.increase}";
        "XF86MonBrightnessDown" = "exec --no-startup-id ${commands.brightness.decrease}";

        "Print" = "exec --no-startup-id ${commands.screenshot.full}";
        "${modifier}+Print" = "exec --no-startup-id ${commands.screenshot.rect}";
      };
    };
  };
}
