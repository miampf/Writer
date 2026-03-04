{
  goyo.enable = true;
  render-markdown.enable = true;
  treesitter = {
    enable = true;
    highlight.enable = true;
  };
  fugitive.enable = true;
  yazi.enable = true;
  airline.enable = true;
  telescope.enable = true;
  web-devicons.enable = true;
  dashboard = {
    enable = true;
    settings.config = {
      header = [
        "▄▄▄                                "
        "█▀██  ██  ██▀▀       █▄            "
        "  ██  ██  ██ ▄    ▀▀▄██▄      ▄    "
        "  ██  ██  ██ ████▄██ ██ ▄█▀█▄ ████▄"
        "  ██▄ ██▄ ██ ██   ██ ██ ██▄█▀ ██   "
        "  ▀████▀███▀▄█▀  ▄██▄██▄▀█▄▄▄▄█▀   "
      ];
      packages.enable = false;
      shortcut = [
        {
          icon = " ";
          desc = "File ";
          key = "f";
          action = "Telescope find_files";
        }
        {
          icon = " ";
          desc = "Recent ";
          key = "r";
          action = "Telescope oldfiles";
        }
      ];
      footer = [ "Made with love by miampf!" ];
    };
  };
}
