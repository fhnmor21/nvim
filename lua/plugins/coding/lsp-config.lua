return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = true,
      cmd = "Mason",
      keys = {
        { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
      },
    },
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
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "clangd" },
      handlers = {
        -- 1. Default handler
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- 2. Unreal-optimized clangd setup
        ["clangd"] = function()
          lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {
              "clangd",
              "--background-index",
              "--pch-storage=memory",
              "--header-insertion=never",
              "--completion-style=detailed",
              "--all-scopes-completion",
              -- Add this if you use Unreal Engine's compile_commands.json
              "--query-driver=C:/Program Files/Microsoft Visual Studio/**/bin/Hostx64/x64/cl.exe",
            },
          })
        end,

        -- 3. Optimized lua_ls (using lazydev for the workspace)
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
      },
    })

    require("mason-null-ls").setup({
      automatic_setup = true,
    })

    -- LspAttach Autocmd for Keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
        end

        map("<leader>cl", "<cmd>LspInfo<cr>", "LspInfo")
        map("gD", vim.lsp.buf.declaration, "Go To Declaration")
        map("gd", vim.lsp.buf.definition, "Go To Declaration")
        map("gi", vim.lsp.buf.implementation, "Go To Implementation")
        map("gi", vim.lsp.buf.implementation, "Go To Implementation")
        map("<C-k>", vim.lsp.buf.signature_help, "Show Signature")
        map("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
        map("gr", vim.lsp.buf.references, "Find References")
        map("<leader>co", "<cmd>Lspsaga outline<cr>", "Code Outline")
        map("<leader>ct", "<cmd>Lspsaga incoming_calls<cr>", "CallTo")
        map("<leader>cf", "<cmd>Lspsaga outgoing_calls<cr>", "CallFrom")
        map("<leader>cp", "<cmd>Lspsaga peek_definition<cr>", "Peek Definition")

        map("<leader>cF", function()
          vim.lsp.buf.format({ async = true })
        end, "Format")

        map("K", "<cmd>Lspsaga hover_doc<cr>", "Hover")
        map("gd", "<cmd>Lspsaga goto_definition<cr>", "Definition")
        map("gr", "<cmd>Lspsaga finder<cr>", "Finder")
        map("<leader>ca", "<cmd>Lspsaga code_action<cr>", "Code Action")
        map("<leader>cr", "<cmd>Lspsaga rename<cr>", "Rename")
      end,
    })
  end,
}
