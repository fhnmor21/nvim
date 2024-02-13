return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      cmd = "Mason",
      -- build = ":MasonUpdates", -- :MasonUpdate updates registry contents
      keys = {
        { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" }
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
    },
    {
      "jay-babu/mason-null-ls.nvim",
      dependencies = {
        "nvimtools/none-ls.nvim",
      }
    },
    {
      "lewis6991/hover.nvim",
      config = function()
        require("hover").setup {
            init = function()
                -- Require providers
                require("hover.providers.lsp")
            end,
            preview_opts = {
                border = "single"
            },
            -- Whether the contents of a currently open hover window should be moved
            -- to a :h preview-window when pressing the hover keymap.
            preview_window = false,
            title = true,
        }
      end
    },
    {
      "glepnir/lspsaga.nvim",
      cmd = "Lspsaga",
      config = function()
        require("lspsaga").setup({})
      end,
    },
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("lsp_signature").setup({
          bind = true, -- This is mandatory, otherwise border config won't get registered.
          handler_opts = {
            border = "rounded"
          },
        })
      end
    },
    -- auto completion using lsp
    {"hrsh7th/cmp-nvim-lsp",},
    -- {
    --   "ray-x/navigator.lua",
    --   dependencies = {
    --     { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
    --     { "neovim/nvim-lspconfig" },
    --     { "nvim-treesitter/nvim-treesitter" },
    --   },
    --   config = function()
    --     require("navigator").setup({
    --       mason = true,
    --     })
    --   end
    -- },
  },
  opts = {
  },
  config = function(_, opts)
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("mason").setup(opts)
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers({
      -- general handler for languages we do not have a specific setup
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({
          capabilities = capabilities,
          -- custom settings for lua
          settings = {
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
          }
        })
      end
    })
    require("mason-null-ls").setup({
      automatic_setup = true,
    })

    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        opts.desc = "Go To Declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        opts.desc = "Go To Declaration"
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        opts.desc = "Go To Implementation"
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        opts.desc = "Show Signature"
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        --opts.desc = "Hover"
        --vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        -- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set("n", "<leader>wl", function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        opts.desc = "Type Definition"
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        --opts.desc = "Rename"
        --vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        opts.desc = "Code Action"
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        opts.desc = "Find References"
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        opts.desc = "Format"
        vim.keymap.set("n", "<leader>f", function()
                          vim.lsp.buf.format { async = true }
                        end, opts)
        opts.desc = "LspInfo"
        vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", opts)
        opts.desc = "Hover"
        vim.keymap.set("n", "K", require("hover").hover, opts)
        opts.desc = "Hover Selected"
        vim.keymap.set("n", "gK", require("hover").hover_select, opts)
        -- opts.desc = "Hover Previous"
        -- vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end, opts)
        -- opts.desc = "Hover Next"
        -- vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, opts)

        opts.desc = "Code Outline"
        vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outline<cr>", opts)
        opts.desc = "CallTo"
        vim.keymap.set("n", "<leader>ct", "<cmd>Lspsaga incoming_calls<cr>", opts)
        opts.desc = "CallFrom"
        vim.keymap.set("n", "<leader>cf", "<cmd>Lspsaga outgoing_calls<cr>", opts)
        opts.desc = "Peek Definition"
        vim.keymap.set("n", "<leader>cp", "<cmd>Lspsaga peek_definition<cr>", opts)
        opts.desc = "Search"
        vim.keymap.set("n", "<leader>cs", "<cmd>Lspsaga finder<cr>", opts)
        opts.desc = "Rename"
        vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<cr>", opts)
      end,
    })

    require("lspsaga").setup({
     -- keybinds for navigation in lspsaga window
     -- scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
     -- use enter to open file with definition preview
    --  definition = {
    --    edit = "<CR>",
    --  },
    })
  end
}
