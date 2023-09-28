{ pkgs, ... }: {
  home.sessionVariables =
    let
      loadersCache = pkgs.gnome._gdkPixbufCacheBuilder_DO_NOT_USE {
        extraLoaders = [ pkgs.librsvg ];
      };
    in
    {
      GDK_PIXBUF_MODULE_FILE = "${loadersCache}";
    };
}
