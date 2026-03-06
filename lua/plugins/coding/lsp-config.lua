return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
    "nvimtools/none-ls.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
    {
      "nvimdev/lspsaga.nvim",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
      },
      opts = {
        ui = { border = "rounded", devicon = true },
        lightbulb = { enable = false },
      },
    },
  },
  config = function()
  local lspconfig = require("lspconfig")
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- 1. Setup Mason
  require("mason").setup()

  -- 2. Setup Mason-LSPConfig with Handlers inside the setup call
  -- This fixes the "setup_handlers is nil" error
  require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd" },
    handlers = {
      -- The first entry (without a key) is the default handler
      function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
      })
      end,

      -- Specific handler for lua_ls
      ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })
      end,
    }
  })

  -- 3. Mason-Null-LS
  require("mason-null-ls").setup({
    automatic_setup = true,
  })

  -- 4. LspAttach for Keymaps
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                              callback = function(ev)
                              local opts = { buffer = ev.buf }

                              -- Lspsaga UI Keymaps
                              vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover", buffer = ev.buf })
                              vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", { desc = "Go to Definition", buffer = ev.buf })
                              vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek Definition", buffer = ev.buf })
                              vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<cr>", { desc = "LSP Finder", buffer = ev.buf })
                              vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { desc = "Code Action", buffer = ev.buf })
                              vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<cr>", { desc = "Rename", buffer = ev.buf })
                              vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outline<cr>", { desc = "Outline", buffer = ev.buf })

                              -- Fallbacks/Standard
                              vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                              vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                              vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                              end,
  })
  end
}
