{ lib
, user
, ...
}:
with user.colorscheme; {
  programs.zathura = {
    enable = true;
    options = {
      window-title-basename = "true";
      selection-clipboard = "clipboard";

      notification-error-bg = "${danger}";
      notification-error-fg = "${foreground}";
      notification-warning-bg = "${warning}";
      notification-warning-fg = "${border}";
      notification-bg = "${background}";
      notification-fg = "${foreground}";

      completion-bg = "${background}";
      completion-fg = "${comment}";
      completion-group-bg = "${background}";
      completion-group-fg = "${comment}";
      completion-highlight-bg = "${border}";
      completion-highlight-fg = "${foreground}";

      index-bg = "${background}";
      index-fg = "${foreground}";
      index-active-bg = "${border}";
      index-active-fg = "${foreground}";

      inputbar-bg = "${background}";
      inputbar-fg = "${foreground}";
      statusbar-bg = "${background}";
      statusbar-fg = "${foreground}";

      highlight-color = "${tertiary}";
      highlight-active-color = "${secondary}";

      default-bg = "${background}";
      default-fg = "${foreground}";

      render-loading = true;
      render-loading-fg = "${background}";
      render-loading-bg = "${foreground}";

      recolor-lightcolor = "${background}";
      recolor-darkcolor = "${foreground}";

      adjust-open = "width";
      recolor = true;
    };
  };
}
