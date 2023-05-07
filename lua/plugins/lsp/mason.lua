local Util = require("config.func_utils")
return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { 
    { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } 
  },
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
    },
  },
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  --[[
  ---@param opts MasonSettings | {ensure_installed: string[]}
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    local function ensure_installed()
      Util.ensure_installed(mr, opts)
    end

    if mr.refresh then
      mr.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
  ]]--
}