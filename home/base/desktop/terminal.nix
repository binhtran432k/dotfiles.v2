{ lib, user, ... }:
{
  programs.kitty = lib.mkIf (user.terminal-app == "kitty") {
    enable = true;
  };
}
