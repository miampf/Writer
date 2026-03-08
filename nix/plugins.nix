{
  goyo.enable = true;
  twilight.enable = true;
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
  flash.enable = true;
  diffview.enable = true;
  blink-cmp.enable = true;
  autoclose.enable = true;
  obsidian = {
    enable = true;
    settings.legacy_commands = false;
    settings.workspaces = [
      {
        name = "Documents";
        path = "~/Documents";
      }
    ];
  };
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
          action = "Yazi cwd";
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
