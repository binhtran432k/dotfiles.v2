{ pkgs, user, ... }:

with user.colorscheme;

{
  home.packages = with pkgs; [
    vimiv-qt
  ];

  home.file = {
    ".config/vimiv/vimiv.conf".text = ''
      [GENERAL]
      monitor_filesystem = True
      shuffle = False
      startup_library = True
      style = custom

      [COMMAND]
      history_limit = 100

      [COMPLETION]
      fuzzy = False

      [SEARCH]
      ignore_case = True
      incremental = True

      [IMAGE]
      autoplay = True
      autowrite = ask
      overzoom = 1.0

      [LIBRARY]
      width = 0.3
      show_hidden = False

      [THUMBNAIL]
      size = 128

      [SLIDESHOW]
      delay = 2.0
      indicator = slideshow:

      [STATUSBAR]
      collapse_home = True
      show = True
      message_timeout = 60000
      mark_indicator = <b>*</b>
      left = {pwd}
      left_image = {index}/{total} {basename} [{zoomlevel}]
      left_thumbnail = {thumbnail-index}/{thumbnail-total} {thumbnail-name}
      left_manipulate = {basename}   {image-size}   Modified: {modified}   {processing}
      center_thumbnail = {thumbnail-size}
      center = {slideshow-indicator} {slideshow-delay} {transformation-info}
      right = {keys}  {mark-count}  {mode}
      right_image = {keys}  {mark-indicator} {mark-count}  {mode}

      [KEYHINT]
      delay = 500
      timeout = 5000

      [TITLE]
      fallback = vimiv
      image = vimiv - {basename}

      [METADATA]
      keys1 = Exif.Image.Make, Exif.Image.Model, Exif.Image.DateTime, Exif.Photo.ExposureTime, Exif.Photo.FNumber, Exif.Photo.IsoSpeedRatings, Exif.Photo.FocalLength, Exif.Photo.LensMake, Exif.Photo.LensModel, Exif.Photo.ExposureBiasValue
      keys2 = Exif.Photo.ExposureTime, Exif.Photo.FNumber, Exif.Photo.IsoSpeedRatings, Exif.Photo.FocalLength
      keys3 = Exif.Image.Artist, Exif.Image.Copyright

      [PLUGINS]
      print = default

      [ALIASES]
    '';

    ".config/vimiv/keys.conf".text = ''
      [GLOBAL]
      <colon> : command
      o : command --text='open '
      yy : copy-name
      ya : copy-name --abspath
      yA : copy-name --abspath --primary
      yY : copy-name --primary
      x : delete %%
      gi : enter image
      gl : enter library
      gm : enter manipulate
      gt : enter thumbnail
      f : fullscreen
      G : goto -1
      gg : goto 1
      m : mark %%
      q : quit
      . : repeat-command
      j : scroll down
      h : scroll left
      l : scroll right
      k : scroll up
      / : search
      ? : search --reverse
      N : search-next
      P : search-prev
      zh : set library.show_hidden!
      b : set statusbar.show!
      tl : toggle library
      tm : toggle manipulate
      tt : toggle thumbnail

      [IMAGE]
      M : center
      | : flip
      _ : flip --vertical
      <end> : goto -1
      <home> : goto 1
      i : metadata
      <page-down> : next
      n : next
      <ctrl>n : next --keep-zoom
      <space> : play-or-pause
      <page-up> : prev
      p : prev
      <ctrl>p : prev --keep-zoom
      > : rotate
      < : rotate --counter-clockwise
      W : scale --level=1
      <equal> : scale --level=fit
      w : scale --level=fit
      E : scale --level=fit-height
      e : scale --level=fit-width
      J : scroll-edge down
      H : scroll-edge left
      L : scroll-edge right
      K : scroll-edge up
      sl : set slideshow.delay +0.5
      sh : set slideshow.delay -0.5
      ss : slideshow
      + : zoom in
      - : zoom out

      [LIBRARY]
      go : goto 1 --open-selected
      n : scroll down --open-selected
      p : scroll up --open-selected
      L : set library.width +0.05
      H : set library.width -0.05

      [THUMBNAIL]
      + : zoom in
      - : zoom out

      [COMMAND]
      <tab> : complete
      <shift><tab> : complete --inverse
      <ctrl>p : history next
      <ctrl>n : history prev
      <up> : history-substr-search next
      <down> : history-substr-search prev
      <escape> : leave-commandline

      [MANIPULATE]
      <colon> : command
      f : fullscreen
      b : set statusbar.show!
    '';

    ".config/vimiv/styles/custom".text = ''
      [STYLE]
      ; Colors
      base00 = ${background}
      base01 = #3a3c4e
      base02 = ${border}
      base03 = ${comment}
      base04 = #62d6e8
      base05 = ${foreground}
      base06 = #f1f2f8
      base07 = #f7f7fb
      base08 = ${danger}
      base09 = ${tertiary}
      base0a = ${warning}
      base0b = ${success}
      base0c = ${info}
      base0d = ${primary}
      base0e = ${secondary}
      base0f = #00f769

      ; Additional custom overrides, e.g.
      ; font = 10pt Hack
      ; thumbnail.padding = 32
    '';
  };
}
