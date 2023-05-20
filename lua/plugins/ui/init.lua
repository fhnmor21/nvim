return {
  -- the colorscheme should be available when starting Neovim
  require("plugins.ui.colortheme"),

  -- better vim.ui
  require("plugins.ui.dressing"),

  -- bufferline
  require("plugins.ui.bufferline"),

  -- statusline
  require("plugins.ui.lualine"),

  -- indent guides for Neovim
  require("plugins.ui.indent-blankline"),

  -- lsp symbol navigation for lualine
  -- require("plugins.ui.navic"),

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- ui components
  { "MunifTanjim/nui.nvim",        lazy = true },
}
