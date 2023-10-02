# XDG stands for "Cross-Desktop Group", with X used to mean "cross".
# It's a bunch of specifications from freedesktop.org intended to standardize desktops and
# other GUI applications on various systems (primarily Unix-like) to be interoperable:
#   https://www.freedesktop.org/wiki/Specifications/
{ config
, pkgs
, ...
}: {
  home.shellAliases = {
    o = "xdg-open";
  };
  home.packages = with pkgs; [
    xdg-utils # provides cli tools such as `xdg-mime` `xdg-open`
    xdg-user-dirs
  ];

  xdg = {
    enable = true;
    cacheHome = "${config.home.homeDirectory}/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications =
        let
          browser = [ "brave.desktop" ];
          pdfviewer = [ "org.pwmt.zathura.desktop" ];
          imageviewer = [ "vimiv.desktop" ];
          mediaplayer = [ "mpv.desktop" ];
        in
        {
          "application/json" = browser;
          "application/pdf" = pdfviewer;

          "text/html" = browser;
          "text/xml" = browser;
          "application/xml" = browser;
          "application/xhtml+xml" = browser;
          "application/xhtml_xml" = browser;
          "application/rdf+xml" = browser;
          "application/rss+xml" = browser;
          "application/x-extension-htm" = browser;
          "application/x-extension-html" = browser;
          "application/x-extension-shtml" = browser;
          "application/x-extension-xht" = browser;
          "application/x-extension-xhtml" = browser;

          "x-scheme-handler/about" = browser;
          "x-scheme-handler/ftp" = browser;
          "x-scheme-handler/http" = browser;
          "x-scheme-handler/https" = browser;
          "x-scheme-handler/unknown" = browser;

          "audio/*" = mediaplayer;
          "video/*" = mediaplayer;
          "image/*" = imageviewer;
          "image/gif" = imageviewer;
          "image/jpeg" = imageviewer;
          "image/png" = imageviewer;
          "image/webp" = imageviewer;

          "x-scheme-handler/discord" = [ "discord.desktop" ];
          "x-scheme-handler/tg" = [ "telegramdesktop.desktop" ];
        };

      associations.removed = {
        # ......
      };
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };
}
