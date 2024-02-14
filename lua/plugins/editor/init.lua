return {
  -- which-key
  require("plugins.editor.whichkey"),

  -- fuzzy finder
  require("plugins.editor.telescope"),

  -- magic jump within the buffer
  require("plugins.editor.jump"),

  -- references
  require("plugins.editor.illuminate"),

  -- search/replace in multiple files
  require("plugins.editor.spectre"),

  -- search/replace in multiple files
  require("plugins.editor.auto-pairs"),


  --[[
  -- in buffer file explorer
  -- require("plugins.editor.oil"),

  -- buffer remove
  require("plugins.editor.buffer-remove"),

  -- session management
  require("plugins.editor.persistence"),

  -- vim be good - game to practice vim movements
  -- {"ThePrimeagen/vim-be-good",},
  ]] --

  -- cursor multi-select
  {
    'mg979/vim-visual-multi',
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end
  },

  -- fidget
  { "j-hui/fidget.nvim", },
}
