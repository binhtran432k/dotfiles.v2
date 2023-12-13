{ pkgs, ... }:
{
  home.packages = with pkgs; [
    goldendict-ng
  ];
}
