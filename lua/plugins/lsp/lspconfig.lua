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
        return require("config.func_utils").has("nvim-cmp")
      end,
    },
    "ray-x/lsp_signature.nvim",
    "glepnir/lspsaga.nvim",
  },
  ---@class PluginLspOpts
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
  ---@param opts PluginLspOpts
  config = function(_, opts)
    -- setup autoformat
    require("plugins.lsp.format").autoformat = opts.autoformat

    -- setup formatting and keymaps
    local Util = require("config.func_utils")
    Util.on_attach(function(client, buffer)
      require("plugins.lsp.format").on_attach(client, buffer)
      require("plugins.lsp.keymaps").on_attach(client, buffer)
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
      hint_prefix = data.icons.misc.Squirrel .. " ",
    })

    require("lspsaga").setup({
      -- keybinds for navigation in lspsaga window
      scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
      -- use enter to open file with definition preview
      definition = {
        edit = "<CR>",
      },
    })
  end,
}
