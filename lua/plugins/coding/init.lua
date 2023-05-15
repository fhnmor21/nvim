return {
  -- syntax highlight
  require("plugins.coding.treesitter"),

  -- code snippets
  require("plugins.coding.snippets"),

  -- auto completion
  require("plugins.coding.cmp"),

  -- auto pair brackets
  require("plugins.coding.auto_pairs"),

  -- adding/removing surroundings
  require("plugins.coding.surround"),

  -- git
  require("plugins.coding.git_signs"),
  require("plugins.coding.fugitive"),

  -- code refactoring
  require("plugins.coding.refactoring"),

  -- code navigator
  --  require("plugins.coding.code-navigator"),

  -- c++ tools
  require("plugins.coding.nt-cpp-tools"),

}
