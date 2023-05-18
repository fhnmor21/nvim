-- Debugging
return {
  "mfussenegger/nvim-dap",
  config = function()
    require("lvim.core.dap").setup()
  end,
  lazy = true,
  dependencies = {
    "rcarriga/nvim-dap-ui",
  },
}