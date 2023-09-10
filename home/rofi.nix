{ config, user, pkgs, ... }:

with user.colorscheme;

let
  rofi-calc-wrapper = pkgs.writeShellScriptBin "=" ''
    rofi -show calc -modi calc -no-show-match -no-sort -calc-command "echo -n '{result}' | xsel"
  '';
in {
  home.packages = with pkgs; [
    rofi-calc-wrapper
    rofi-power-menu
  ];

  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-calc
    ];
    theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "*" = {
          background-color = mkLiteral background;
          foreground = mkLiteral foreground;
          active-background = mkLiteral primary;
          urgent-background = mkLiteral danger;
          urgent-foreground = mkLiteral background;
          selected-background = mkLiteral "@active-background";
          selected-urgent-background = mkLiteral "@urgent-background";
          selected-active-background = mkLiteral "@active-background";
          separatorcolor = mkLiteral "@active-background";
          bordercolor = mkLiteral "@active-background";
        };
        "#window" = {
          background-color = mkLiteral "@background-color";
          border = 3;
          border-radius = 6;
          border-color = mkLiteral "@bordercolor";
          padding = 15;
        };
        "#mainbox" = {
          border =  0;
          padding = 0;
        };
        "#message" = {
          border = mkLiteral "0px";
          border-color = mkLiteral "@separatorcolor";
          padding = mkLiteral "1px";
        };
        "#textbox" = {
          text-color = mkLiteral "@foreground";
        };
        "#listview" = {
          fixed-height = mkLiteral "0";
          border = mkLiteral "0px";
          border-color = mkLiteral "@bordercolor";
          spacing = mkLiteral "2px";
          scrollbar = mkLiteral "false";
          padding = mkLiteral "2px 0px 0px";
        };
        "#element" = {
          border = mkLiteral "0";
          padding = mkLiteral "3px";
        };
        "#element.normal.normal" = {
          background-color = mkLiteral "@background-color";
          text-color = mkLiteral "@foreground";
        };
        "#element.normal.urgent" = {
          background-color = mkLiteral "@urgent-background";
          text-color = mkLiteral "@urgent-foreground";
        };
        "#element.normal.active" = {
          background-color = mkLiteral "@active-background";
          text-color = mkLiteral "@foreground";
        };
        "#element.selected.normal" = {
          background-color = mkLiteral "@selected-background";
          text-color = mkLiteral "@foreground";
        };
        "#element.selected.urgent" = {
          background-color = mkLiteral "@selected-urgent-background";
          text-color = mkLiteral "@foreground";
        };
        "#element.selected.active" = {
          background-color = mkLiteral "@selected-active-background";
          text-color = mkLiteral "@foreground";
        };
        "#element.alternate.normal" = {
          background-color = mkLiteral "@background-color";
          text-color = mkLiteral "@foreground";
        };
        "#element.alternate.urgent" = {
          background-color = mkLiteral "@urgent-background";
          text-color = mkLiteral "@foreground";
        };
        "#element.alternate.active" = {
          background-color = mkLiteral "@active-background";
          text-color = mkLiteral "@foreground";
        };
        "#scrollbar" = {
          width = mkLiteral "2px";
          border = mkLiteral "0";
          handle-width = mkLiteral "8px";
          padding = mkLiteral "0";
        };
        "#sidebar" = {
          border = mkLiteral "2px dash 0px 0px";
          border-color = mkLiteral "@separatorcolor";
        };
        "#button.selected" = {
          background-color = mkLiteral "@selected-background";
          text-color = mkLiteral "@foreground";
        };
        "#inputbar" = {
          spacing = mkLiteral "0";
          text-color = mkLiteral "@foreground";
          padding = mkLiteral "1px";
        };
        "#case-indicator" = {
          spacing = mkLiteral "0";
          text-color = mkLiteral "@foreground";
        };
        "#entry" = {
          spacing = mkLiteral "0";
          text-color = mkLiteral "@foreground";
        };
        "#prompt" = {
          spacing = mkLiteral "0";
          text-color = mkLiteral "@foreground";
        };
        "#inputbar" = {
          children = mkLiteral "[ prompt,textbox-prompt-colon,entry,case-indicator ]";
        };
        "#textbox-prompt-colon" = {
          expand = mkLiteral "false";
          str = ">";
          margin = mkLiteral "0px 0.3em 0em 0em";
          text-color = mkLiteral "@foreground";
        };
        "element-text, element-icon" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
      };
  };
}
