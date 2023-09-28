{ pkgs, ... }: rec {
  name = "dracula";
  kitty-theme = "Dracula";
  gtk = {
    name = "Dracula";
    package = pkgs.dracula-theme;
  };
  sublime = builtins.readFile (pkgs.fetchFromGitHub
    {
      owner = "dracula";
      repo = "sublime"; # Bat uses sublime syntax for its themes
      rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
      sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
    }
  + "/Dracula.tmTheme");
  bat = "Dracula";
  delta = bat;

  background = "#282A36";
  foreground = "#F8F8F2";
  secondary-background = bright-black;
  secondary-foreground = foreground;
  emphasis = bright-white;
  border = selection;
  primary = purple;
  secondary = pink;
  tertiary = orange;
  success = green;
  danger = red;
  warning = yellow;
  info = cyan;
  light = foreground;
  dark = background;

  selection = "#44475A";
  comment = "#6272A4";
  orange = "#FFB86C";
  purple = "#BD93F9";
  pink = "#FF79C6";

  # ansi
  black = "#21222C";
  red = "#FF5555";
  green = "#50FA7B";
  yellow = "#F1FA8C";
  blue = purple;
  magenta = pink;
  cyan = "#8BE9FD";
  white = foreground;
  # bright-black = comment;
  bright-black = "#363949";
  bright-red = "#FF6E6E";
  bright-green = "#69FF94";
  bright-yellow = "#FFFFA5";
  bright-blue = "#D6ACFF";
  bright-magenta = "#FF92DF";
  bright-cyan = "#A4FFFF";
  bright-white = "#FFFFFF";

  base00 = background;
  base01 = bright-black;
  base02 = selection;
  base03 = comment;
  base04 = "#62D6E8";
  base05 = foreground;
  base06 = "#F1F2F8";
  base07 = "#F7F7FB";
  base08 = red;
  base09 = orange;
  base0A = yellow;
  base0B = green;
  base0C = cyan;
  base0D = purple;
  base0E = pink;
  base0F = base0B;
}
