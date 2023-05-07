return {

	-- fuzzy finder
	require("plugins.editor.telescope"),

	-- file explorer
	require("plugins.editor.neotree"),

	-- which-key
	require("plugins.editor.whichkey"),

	-- search/replace in multiple files
	require("plugins.editor.spectre"),

  -- magic search within the buffer
	require("plugins.editor.flit"),

	require("plugins.editor.leap"),

	-- references
	require("plugins.editor.illuminate"),

	-- better diagnostics list and others
  require("plugins.editor.trouble"),

	-- buffer remove
	require("plugins.editor.buffer_remove"),

	-- session management
	require("plugins.editor.persistence"),
}
