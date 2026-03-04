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
}
