return {
  require("plugins.lsp.lspconfig"),
  require("plugins.lsp.mason"),
  require("plugins.lsp.null-ls"),
  -- require("plugins.lsp.ccls"),

  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    -- keys = {
    --   { 'zR', "<cmd>openAllFolds<cr>", desc = "Increment selection", mode = "n" },
    --   { 'zM', "<cmd>closeAllFolds<cr>", desc = "Decrement selection", mode = "n" },
    -- },
    config = function(_, opts)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
      local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup({
          capabilities = capabilities
          -- you can add other fields for setting up lsp server in this table
        })
      end
      require('ufo').setup()
    end
  }
}
