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
  --[[
  -- auto pair brackets
  require("plugins.coding.auto-pairs"),

  -- adding/removing surroundings
  require("plugins.coding.surround"),

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
