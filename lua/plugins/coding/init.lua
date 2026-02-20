return {
  -- syntax highlight
  require("plugins.coding.treesitter"),

  -- LSP
  require("plugins.coding.lsp-config"),

  -- better diagnostics list and others
  require("plugins.coding.trouble"),

  -- auto completion
  require("plugins.coding.cmp"),

  -- git
  require("plugins.coding.git"),

  -- debug
  require("plugins.coding.dap"),

  -- folding
  -- require("plugins.coding.ufo"),

  -- adding/removing surroundings
  require("plugins.coding.surround"),

  -- code comment
  require("plugins.coding.comment"),

  -- obsidian vault editor
  require("plugins.coding.obsidian"),

  require("plugins.coding.ai"),
  
  -- markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

--[[

  -- allow editing and integrate org mode files
  -- require("plugins.coding.orgmode"),

  -- code refactoring
  -- require("plugins.coding.refactoring"),

  -- c++ tools
  -- require("plugins.coding.nt-cpp-tools"),

  -- code action menu
  -- require("plugins.coding.action-menu")

]]--

}
