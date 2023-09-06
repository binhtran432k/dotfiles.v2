{ user, ... }:

with user.colorscheme;

{
  services.dunst.settings = {
    global = {
      separator_color = border;
    };

    urgency_low = {
      background = background;
      foreground = comment;
    };

    urgency_normal = {
      background = background;
      foreground = primary;
    };

    urgency_critical = {
      background = background;
      foreground = foreground;
      frame_color = danger;
    };
  };
}
