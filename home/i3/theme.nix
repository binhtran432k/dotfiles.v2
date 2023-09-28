{ user, ... }:
with user.colorscheme; let
  urgent = danger;
  text = foreground;
  indicator = comment;
  focused = primary;
  focusedInactive = secondary-background;
  unfocused = background;
  separator = border;
in
{
  config = {
    xsession.windowManager.i3.config = {
      colors = {
        inherit background;
        urgent = {
          inherit background indicator text;
          border = urgent;
          childBorder = urgent;
        };
        focused = {
          inherit indicator;
          text = dark;
          background = focused;
          border = focused;
          childBorder = focused;
        };
        focusedInactive = {
          inherit indicator text;
          background = focusedInactive;
          border = focusedInactive;
          childBorder = focusedInactive;
        };
        unfocused = {
          inherit background indicator text;
          border = unfocused;
          childBorder = unfocused;
        };
        placeholder = {
          inherit background indicator text;
          border = unfocused;
          childBorder = unfocused;
        };
      };
    };

    lib.theme.i3.bar = {
      colors = {
        inherit background separator;
        statusline = text;
        focusedWorkspace = {
          inherit text;
          background = secondary-background;
          border = focused;
        };
        activeWorkspace = {
          inherit border background;
          text = focused;
        };
        inactiveWorkspace = {
          inherit text border background;
        };
        urgentWorkspace = {
          inherit text background;
          border = urgent;
        };
        bindingMode = {
          inherit text border;
          background = urgent;
        };
      };
    };
  };
}
