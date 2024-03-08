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
  require("plugins.coding.ufo"),

  -- adding/removing surroundings
  require("plugins.coding.surround"),

  -- code comment
  require("plugins.coding.comment"),

  -- obsidian vault editor
  require("plugins.coding.obsidian"),

  -- allow editing and integrate org mode files 
  require("plugins.coding.orgmode"),

  --[[

  -- code refactoring
  -- require("plugins.coding.refactoring"),


  -- c++ tools
  -- require("plugins.coding.nt-cpp-tools"),

  -- code action menu
  require("plugins.coding.action-menu")
]] --
}
