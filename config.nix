{
  plugins = import ./plugins.nix;
  keymaps = import ./keymap.nix;

  globals.mapleader = " ";

  colorschemes.everforest.enable = true;

  extraConfigVim = ''
    autocmd! User GoyoEnter TwilightEnable
    autocmd! User GoyoLeave TwilightDisable
  '';
}
