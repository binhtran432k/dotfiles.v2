{ config, user, pkgs, ... }:
let 
  cfg = config.xsession.windowManager.i3.config;
  modifier = cfg.modifier;
  mycontrol = pkgs.writeShellScriptBin "mycontrol" (builtins.readFile ./mycontrol);
  commands = {
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
  };
in {
  home.packages = [
    mycontrol
  ];

  xsession.windowManager.i3 = {
    config = {
      modifier = "Mod4";
      terminal = user.terminal-app;
      menu = "rofi -show run";
      startup = [
        { command = cfg.terminal; }
        { command = user.mail-app; }
        { command = user.browser-app; }
        { command = "flameshot"; }
        { command = "${pkgs.feh}/bin/feh --no-fehbg --bg-scale ${user.wallpaper}"; }
      ];
      defaultWorkspace = "workspace number 1";
      assigns = {
        "2" = [{ class = "^Brave-browser$"; }];
        "3" = [{ class = "^thunderbird$"; }];
      };
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

        "${modifier}+h" = "split h";
        "${modifier}+v" = "split v";
        "${modifier}+f" = "fullscreen toggle";

        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

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

        "${modifier}+Shift+1" =
          "move container to workspace number 1";
        "${modifier}+Shift+2" =
          "move container to workspace number 2";
        "${modifier}+Shift+3" =
          "move container to workspace number 3";
        "${modifier}+Shift+4" =
          "move container to workspace number 4";
        "${modifier}+Shift+5" =
          "move container to workspace number 5";
        "${modifier}+Shift+6" =
          "move container to workspace number 6";
        "${modifier}+Shift+7" =
          "move container to workspace number 7";
        "${modifier}+Shift+8" =
          "move container to workspace number 8";
        "${modifier}+Shift+9" =
          "move container to workspace number 9";
        "${modifier}+Shift+0" =
          "move container to workspace number 10";

        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";
        "${modifier}+Shift+e" =
          "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

        "${modifier}+r" = "mode resize";

        "Control+Up" = "exec --no-startup-id ${commands.volume.increase}";
        "Control+Down" = "exec --no-startup-id ${commands.volume.decrease}";

        "XF86AudioRaiseVolume" = "exec --no-startup-id ${commands.volume.increase}";
        "XF86AudioLowerVolume" = "exec --no-startup-id ${commands.volume.decrease}";
        "XF86AudioMute" = "exec --no-startup-id ${commands.volume.mute}";
        "XF86AudioMicMute" = "exec --no-startup-id ${commands.volume.mute-mic}";

        "XF86MonBrightnessUp" = "exec --no-startup-id ${commands.brightness.increase}";
        "XF86MonBrightnessDown" = "exec --no-startup-id ${commands.brightness.decrease}";
      };
      modes = {
        resize = {
          "Left" = "resize shrink width 10 px or 10 ppt";
          "Down" = "resize grow height 10 px or 10 ppt";
          "Up" = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 10 px or 10 ppt";
          "Escape" = "mode default";
          "Return" = "mode default";
        };
      };
    };
  };
}
