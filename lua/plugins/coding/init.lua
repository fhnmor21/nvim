return {
	-- syntax highlight
	require("plugins.coding.treesitter"),

	-- coed snippets
	-- require("plugins.coding.snippets"),

	-- auto completion
	-- require("plugins.coding.cmp"),

	-- auto pair brackets
	require("plugins.coding.auto_pairs"),

	-- adding/removing surroundings 
	require("plugins.coding.surround"),

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
