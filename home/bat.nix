{ pkgs
, user
, ...
}: {
  home.sessionVariables = {
    PAGER = "bat";
  };

  home.file.".config/bat/themes/custom.tmTheme".text = user.colorscheme.sublime;

  programs.bat = {
    enable = true;
    config = {
      theme = user.colorscheme.bat;
      map-syntax = [ "*.jenkinsfile:Groovy" "*.props:Java Properties" ];
    };
    extraPackages = with pkgs.bat-extras; [
      batgrep
      batman
      batpipe
      batwatch
      batdiff
      prettybat
    ];
  };
}
