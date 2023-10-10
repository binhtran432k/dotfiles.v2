{ pkgs, ... }:
{
  home.packages = with pkgs; [
    safeeyes
  ];
}
