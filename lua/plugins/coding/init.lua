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
	{
		"tpope/vim-fugitive"
	}

	-- code refactoring
	-- require("plugins.coding.refactoring"),

	-- c++ tools
	--[[
	{
		"Badhi/nvim-treesitter-cpp-tools",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
  ]]--
}
