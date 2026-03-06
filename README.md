# Writer

Writer is a Neovim configuration specifically tailored for creative prose writing
in Markdown. No subscriptions, no overly fancy features
(although some are still there), no generative AI, no bullshit.

> [!NOTE]
> Please note that — currently — this is an _extremely_ opinionated
> work. I mainly write this project for myself, but if you find any
> use in it that's awesome!

## Installation

This project is written entirely in [nix](https://nixos.org), so you need nix
to install it. I won't do an entire tutorial here, but it boils down to enabling
[flakes](https://nixos.wiki/wiki/flakes), importing this flake like the following
and then importing the default package under `inputs.writer.packages.${system}.default`.

```nix
inputs = {
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  writer = {
      url = "github:miampf/Writer";
      inputs.nixpkgs.follows = "nixpkgs";
  };
};
```

You can then open the program by executing `writer`. The configuration is behind it's own
name so that you are completely able to still have your overengineered `nvim` config :)

## Drafts

The core idea of this config is to operate on "drafts" (similar to [ellipsus](https://ellipsus.com)).
Drafts are nothing fancy — just git branches :) You can create a new draft by
executing `:DraftNew`. There, you can make your changes. When you are done, execute
`:DraftMerge`. This will automatically merge the draft and show you a diff view
of the changes made so you can easily do some final adjustments.

## Exporting

This project integrates with [pandoc](https://pandoc.org/) for exporting a folder
to PDF, DOCX or a singular markdown file. To use this, just execute
`:ExportPDF <directory>` (or `ExportDOCX`/`ExportMD`) and an `export.{pdf,docx,md}`
file will be generated.

## Plugins

This project installs various plugins:

- [Airline](https://github.com/vim-airline/vim-airline)
- [Dashboard](https://github.com/nvimdev/dashboard-nvim)
- [Diffview](https://github.com/sindrets/diffview.nvim)
- [Flash](https://github.com/folke/flash.nvim)
- [Fugitive](https://github.com/tpope/vim-fugitive)
- [Goyo](https://github.com/junegunn/goyo.vim)
- [Obsidian-nvim](https://github.com/obsidian-nvim/obsidian.nvim)
- [Render Markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (with all available grammars)
- [Twilight](https://github.com/folke/twilight.nvim)
- [Web Devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [Yazi](https://github.com/mikavilpas/yazi.nvim)

## Keymap

|Mode|Key       |Action                                           |
|----|----------|-------------------------------------------------|
|n   |s         |jump with flash                                  |
|n   |S         |use flash with treesitter                        |
|n   |\<space\>f|open yazi (file viewer) at the current file      |
|n   |\<space\>d|open yazi at the current working directory       |
|n   |\<space\>s|toggle yazi with its latest state                |
|n   |\<space\>z|toggle focus mode (Goyo and Twilight)            |
|n   |\<space\>b|show obsidian-style backlinks to current document|

## What is left to do?

- [ ] Make things configurable with nix options
- [x] Integrate automated pandoc export
- [x] Shortcuts for git (new branch for draft and merging)
- [ ] Maybe find a good option for inline comments (could be great for editing)
- [ ] [Diataxis](https://diataxis.fr/) based documentation
