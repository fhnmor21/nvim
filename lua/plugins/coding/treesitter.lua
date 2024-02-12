return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- version = false, -- last release is way too old and doesn't work on Windows
  -- event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "nvim-treesitter/playground",
      keys = {
        { "<leader>ct", "<CMD>TSPlaygroundToggle<CR>", desc = "Toggle TreeSitter Playground" },
      },
    },
    --[[
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      init = function()
        -- PERF: no need to load the plugin, if we only need its queries for mini.ai
        local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
        local opts = require("lazy.core.plugin").values(plugin, "opts", false)
        local enabled = false
        if opts.textobjects then
          for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
            if opts.textobjects[mod] and opts.textobjects[mod].enable then
              enabled = true
              break
            end
          end
        end
        if not enabled then
          require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        end
      end,
    },
    {
      "HiPhish/nvim-ts-rainbow2",
      config = function(_, opts)
        local rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          --disable = { 'jsx', 'cpp' },
          -- Which query to use for finding delimiters
          query = 'rainbow-parens',
          -- Highlight the entire buffer all at once
          --strategy = require('ts-rainbow').strategy.global,
        }
        local configs = require("nvim-treesitter.configs")
        configs.setup(rainbow)
      end,
    },
    {
      "folke/twilight.nvim",
      opts = {
        dimming = {
          alpha = 0.35,
          context = 18, -- amount of lines we will try to show around the current line
          treesitter = true, -- use treesitter when available for the filetype
          -- treesitter is used to automatically expand the visible text,
          -- but you can further control the types of nodes that should always be fully expanded
        }
      },
    },
    {
      "nvim-treesitter/nvim-treesitter-refactor",
      keys = {
        { "grr", "", desc = "TreeSitter Refactor Rename" },
      },
      config = function(_, opts)
        local configs = require("nvim-treesitter.configs")
        local refactor = {
          highlight_current_scope = { enable = true },
          smart_rename = {
            enable = true,
            -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
            --keymaps = {
            --  smart_rename = "grr",
            --},
          },
        },
        configs.setup(refactor)
      end,
    },
    ]]--
  },

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
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn", -- set to `false` to disable one of the mappings
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    --[[
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
    ]]--
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
