return {
  "aidenlangley/auto-format.nvim",
  event = "BufWinEnter",
  config = function()
    require("auto-format").setup()
  end
}