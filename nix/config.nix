{
  plugins = import ./plugins.nix;
  keymaps = import ./keymap.nix;

  globals.mapleader = " ";

  opts = {
    number = true;
    relativenumber = true;

    shiftwidth = 2;
  };

  colorschemes.everforest.enable = true;

  extraConfigVim = ''
    autocmd! User GoyoEnter TwilightEnable
    autocmd! User GoyoLeave TwilightDisable
  '';

  extraConfigLua = builtins.readFile ../lua/extra_config.lua;

  extraFiles = {
    "lua/helpers.lua".source = ../lua/helpers.lua;
    "lua/export.lua".source = ../lua/export.lua;
    "lua/drafts.lua".source = ../lua/drafts.lua;
  };
}
