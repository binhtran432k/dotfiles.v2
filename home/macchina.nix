{ pkgs, ... }:
{
  home.packages = with pkgs; [
    macchina
  ];
  home.file = {
    ".config/macchina/macchina.toml".text = ''
      theme = "custom"
    '';
    ".config/macchina/themes/custom.toml".text = ''
      spacing = 1
      padding = 0
      hide_ascii = true
      separator = ">"
      key_color = "Blue"
      separator_color = "Magenta"
      [palette]
      type = "Full"
      visible = false
      [bar]
      glyph = "ߋ"
      symbol_open = '['
      symbol_close = ']'
      hide_delimiters = true
      visible = false
      [box]
      border = "plain"
      visible = false
      [box.inner_margin]
      x = 1
      y = 0
      [randomize]
      key_color = false
      separator_color = false
      [keys]
      host = "Host"
      kernel = "Kernel"
      battery = "Battery"
      os = "OS"
      de = "DE"
      wm = "WM"
      distro = "Distro"
      terminal = "Terminal"
      shell = "Shell"
      packages = "Packages"
      uptime = "Uptime"
      memory = "Memory"
      machine = "Machine"
      local_ip = "Local IP"
      backlight = "Brightness"
      resolution = "Resolution"
      cpu_load = "CPU Load"
      cpu = "CPU"
      gpu = "GPU"
      disk_space = "Disk Space"
    '';
  };
}
