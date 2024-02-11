return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  opts = {
    sync_install = false,
    auto_install = true,
    indent = { enable = true },
    highlight = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false },
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "json",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "yaml",
    },

  },

  config = function(_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)

    -- vim.opt.foldmethod = "indent"
    -- vim.opt.foldmethod = "expr"
    -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    -- vim.opt.nofoldenable   -- Disable folding at startup.
  end,
}
