local Util = require("config.func_utils")
return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'jay-babu/mason-null-ls.nvim',
    'jose-elias-alvarez/null-ls.nvim',
  },
  keys = { 
    { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } 
  },
  opts = {
  },
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  config = function(_, opts)
    require("mason").setup(opts)
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
      ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({
          settings = { -- custom settings for lua
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                -- make language server aware of runtime files
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
            },
          },
        })
      end
    })

    require("mason-null-ls").setup({
      automatic_setup = true,
    })
  end
}