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
	},

	-- code refactoring
	require("plugins.coding.refactoring"),

	-- c++ tools
	{
		"Badhi/nvim-treesitter-cpp-tools",
		event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
		config = function(_, opts)
			require 'nt-cpp-tools'.setup({
				header_extension = {'h', 'hpp'}, -- optional
    	source_extension = {'c', 'cpp', 'cxx'}, -- optional
			})
		end
	},
}
