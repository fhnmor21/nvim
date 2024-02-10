return {
  "simrat39/symbols-outline.nvim",
  keys = {
    { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Toggle Symbols Outline" },
  },
  config = function(_, _)
    require("symbols-outline").setup()
  end
}
