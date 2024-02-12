return {
  -- syntax highlight
  require("plugins.coding.treesitter"),

  -- LSP
  require("plugins.coding.lsp-config"),

  -- better diagnostics list and others
  require("plugins.coding.trouble"),
  
  --[[
  -- code snippets
  require("plugins.coding.snippets"),

  -- auto completion
  require("plugins.coding.cmp"),

  -- auto pair brackets
  require("plugins.coding.auto-pairs"),

  -- adding/removing surroundings
  require("plugins.coding.surround"),

  -- git
  require("plugins.coding.git-signs"),
  require("plugins.coding.fugitive"),

  -- code refactoring
  -- require("plugins.coding.refactoring"),

  -- code comment
  require("plugins.coding.comment"),

  -- c++ tools
  -- require("plugins.coding.nt-cpp-tools"),

  -- code action menu
  require("plugins.coding.action-menu")

  -- code navigator
  --  require("plugins.coding.code-navigator"),
]]--
}
