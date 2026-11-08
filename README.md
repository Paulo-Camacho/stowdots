personal dot files

- requirements
    - neovim (0.12+, the config uses `vim.pack` and `vim.lsp.config`)
        - $ brew install tree-sitter-cli ripgrep fd lazygit
        - clangd: ships with the Xcode command line tools
        - mason installs the rest of the language servers and formatters on
          first launch; `:Mason` shows what it has

- neovim layout
    - `init.lua` loads `lua/config/*` in order
    - `keymaps.lua`    every global mapping (LSP ones are in `lsp.lua`, they
                       only exist once a server attaches)
    - `options.lua`    editor options
    - `autocmds.lua`   yank highlight, autopairs, restore cursor position
    - `plugins.lua`    the single `vim.pack.add()` call, then oil + telescope
    - `lsp.lua`        mason, servers, diagnostics, LSP keymaps
    - `completion.lua` blink.cmp
    - `format.lua`     conform; format-on-save is off, `<leader>uf` toggles it
    - `editor.lua`     snacks, which-key, gitsigns, flash, trouble, mini.*
    - `statusline.lua` hand-rolled statusline

- vscode / vscodium
    - stow these with `--no-folding` so only the config files get linked and
      the editor's caches and state stay out of the repo:
        - $ stow --no-folding vscode vscodium
    - linux reads ~/.config/Code and ~/.config/VSCodium natively
    - macOS hardcodes ~/Library/Application Support/VSCodium, so on a new mac
      move it under ~/.config once (quit VSCodium first, before stowing):
        - $ d=~/Library/Application\ Support/VSCodium
        - $ mv "$d" ~/.config/VSCodium && ln -s ~/.config/VSCodium "$d"
        - $ rm ~/.config/VSCodium/User/settings.json   (stow won't overwrite it)
