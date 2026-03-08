[
  # flash.nvim keymap
  {
    mode = "n";
    key = "s";
    options.silent = true;
    action = "<cmd>lua require('flash').jump()<cr>";
  }
  {
    mode = "n";
    key = "S";
    options.silent = true;
    action = "<cmd>lua require('flash').treesitter()<cr>";
  }

  # yazi
  {
    mode = "n";
    key = "<leader>f";
    options.silent = true;
    action = "<cmd>Yazi<cr>";
  }
  {
    mode = "n";
    key = "<leader>d";
    options.silent = true;
    action = "<cmd>Yazi cwd<cr>";
  }
  {
    mode = "n";
    key = "<leader>s";
    options.silent = true;
    action = "<cmd>Yazi toggle<cr>";
  }

  # goyo
  {
    mode = "n";
    key = "<leader>z";
    options.silent = true;
    action = "<cmd>Goyo<cr>";
  }

  # obsidian
  {
    mode = "n";
    key = "<leader>b";
    action = "<cmd>Obsidian backlinks<cr>";
  }
]
