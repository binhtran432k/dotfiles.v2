{ user, ... }:
rec {
  systemd.user.sessionVariables = {
    BROWSER = user.browser-app;
  };
  home.sessionVariables = systemd.user.sessionVariables;
}
