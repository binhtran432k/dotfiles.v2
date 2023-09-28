{ ... }: {
  fileSystems."/hard-disk/Media" = {
    device = "/dev/disk/by-label/Media";
    fsType = "ntfs";
  };
  fileSystems."/hard-disk/Data" = {
    device = "/dev/disk/by-label/Data";
    fsType = "ntfs";
  };
}
