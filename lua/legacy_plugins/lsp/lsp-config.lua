return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neoconf.nvim",
      cmd = "Neoconf",
      config = true
    },
    "folke/neodev.nvim",
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
      "hrsh7th/cmp-nvim-lsp",
      cond = function()
        return require("config.func-utils").has("nvim-cmp")
      end,
    },
    "ray-x/lsp_signature.nvim",
    -- "glepnir/lspsaga.nvim",
  },
  opts = {
    -- options for vim.diagnostic.config()
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
        -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
        -- prefix = "icons",
      },
      severity_sort = true,
    },
    -- Automatically format on save
    autoformat = true,
    -- options for vim.lsp.buf.format
    -- `bufnr` and `filter` is handled???
    -- but can be also overridden when specified
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
  },

  config = function(_, opts)
    -- setup autoformat
    require("plugins.lsp.format").autoformat = opts.autoformat

    -- setup formatting
    local Util = require("config.func-utils")
    Util.on_attach(
      function(client, buffer)
        require("plugins.lsp.format").on_attach(client, buffer)

        local new_opts = { buffer = buffer, silent = true, has = nil }
        new_opts.desc = "Line Diagnostics"
        vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, new_opts)
        new_opts.desc = "LspInfo"
        vim.keymap.set('n', '<leader>cl', '<cmd>LspInfo<cr>', new_opts)
        new_opts.desc = "References"
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', new_opts)
        new_opts.desc = "Go To Declaration"
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, new_opts)
        new_opts.desc = "Go To Implementation"
        vim.keymap.set('n', 'gI', '<cmd>Telescope lsp_implementations<cr>', new_opts)
        new_opts.desc = "Go To Type Definition"
        vim.keymap.set('n', 'gy', '<cmd>Telescope lsp_type_definitions<cr>', new_opts)
        -- new_opts.desc = "Hover"
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, new_opts)
        new_opts.desc = "Go To Definition"
        --        new_opts.has = "definition"
        vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', new_opts)
        new_opts.desc = "Signature Help"
        --        new_opts.has = "signatureHelp"
        vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, new_opts)
      end)

    -- diagnostics icons
    for name, icon in pairs(require("config.data").icons.diagnostics) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end

    if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
      opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
          or function(diagnostic)
            local icons = require("config.data").icons.diagnostics
            for d, icon in pairs(icons) do
              if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
                return icon
              end
            end
          end
    end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    local data = require("config.data")
    require "lsp_signature".setup({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded"
      },
      hint_prefix = data.icons.misc.Squirrel .. "  ",
    })

    --require("lspsaga").setup({
    --  -- keybinds for navigation in lspsaga window
    --  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
    --  -- use enter to open file with definition preview
    --  definition = {
    --    edit = "<CR>",
    --  },
    --})
  end,
}
