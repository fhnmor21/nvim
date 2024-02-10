-- Debugger user interface
return {
  "rcarriga/nvim-dap-ui",
  config = function()
    require("lvim.core.dap").setup_ui()
  end,
  lazy = true,
}
