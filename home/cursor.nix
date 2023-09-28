{ user, ... }: {
  home.pointerCursor = {
    inherit (user.cursor) package name size;
    gtk.enable = true;
    x11.enable = true;
  };
}
