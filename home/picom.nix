{ ... }: {
  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
    fadeDelta = 5;
    settings = {
      blur = {
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
    };
    vSync = true;
  };
}
