return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}
