{ pkgs, ... }: {
  home.packages = with pkgs; [
    # blender # 3d modeling
    gimp # image editing
    inkscape # vector graphics
  ];

  programs = {
    # video recorder/streaming
    obs-studio.enable = true;
  };
}
