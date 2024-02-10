return {
  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- ui components
  { "MunifTanjim/nui.nvim",        lazy = true },

  -- the colorscheme should be available when starting Neovim
  require("plugins.ui.colortheme"),

   -- file explorer
   require("plugins.ui.neotree"),

     -- statusline
  require("plugins.ui.lualine"),

}
