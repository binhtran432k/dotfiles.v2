{ user, ... }:

with user.colorscheme;

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "Maple Mono";
        separator_color = border;
      };

      urgency_low = {
        background = background;
        foreground = comment;
      };

      urgency_normal = {
        background = background;
        foreground = foreground;
      };

      urgency_critical = {
        background = background;
        foreground = foreground;
        frame_color = danger;
      };
    };
  };
}
