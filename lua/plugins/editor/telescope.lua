local Util = require("config.func-utils")
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  dependencies = {
    {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
  },
  keys = {
    { "<leader>,",       "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
    { "<leader>/",       "<cmd>Telescope live_grep<cr>",                     desc = "Grep" },
    { "<leader>:",       "<cmd>Telescope command_history<cr>",               desc = "Command History" },
    { "<leader><space>", "<cmd>Telescope find_files<cr>",                    desc = "Find Files" },
    -- find
    { "<leader>fb",      "<cmd>Telescope buffers<cr>",                       desc = "Buffers" },
    { "<leader>ff",      "<cmd>Telescope find_files<cr>",                    desc = "Find Files" },
    --- { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",                      desc = "Recent" },
    --- { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
    -- git
    { "<leader>gc",      "<cmd>Telescope git_commits<CR>",                   desc = "commits" },
    { "<leader>gs",      "<cmd>Telescope git_status<CR>",                    desc = "status" },
    -- search
    { "<leader>sa",      "<cmd>Telescope autocommands<cr>",                  desc = "Auto Commands" },
    { "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>",     desc = "Buffer" },
    { "<leader>sc",      "<cmd>Telescope command_history<cr>",               desc = "Command History" },
    { "<leader>sC",      "<cmd>Telescope commands<cr>",                      desc = "Commands" },
    { "<leader>sd",      "<cmd>Telescope diagnostics bufnr=0<cr>",           desc = "Document diagnostics" },
    { "<leader>sD",      "<cmd>Telescope diagnostics<cr>",                   desc = "Workspace diagnostics" },
    { "<leader>sg",      "<cmd>Telescope live_grep<cr>",                     desc = "Grep" },
    --- { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    { "<leader>sh",      "<cmd>Telescope help_tags<cr>",                     desc = "Help Pages" },
    { "<leader>sH",      "<cmd>Telescope highlights<cr>",                    desc = "Search Highlight Groups" },
    { "<leader>sk",      "<cmd>Telescope keymaps<cr>",                       desc = "Key Maps" },
    { "<leader>sM",      "<cmd>Telescope man_pages<cr>",                     desc = "Man Pages" },
    { "<leader>sm",      "<cmd>Telescope marks<cr>",                         desc = "Jump to Mark" },
    { "<leader>so",      "<cmd>Telescope vim_options<cr>",                   desc = "Options" },
    { "<leader>sR",      "<cmd>Telescope resume<cr>",                        desc = "Resume" },
    { "<leader>sw",      "<cmd>Telescope grep_string<cr>",                   desc = "Word" },
    --- { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
    {
      "<leader>uC",
      Util.telescope("colorscheme", { enable_preview = true }),
      desc = "Colorscheme with preview",
    },
    {
      "<leader>ss",
      Util.telescope("lsp_document_symbols", {
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      desc = "Goto Symbol",
    },
    {
      "<leader>sS",
      Util.telescope("lsp_dynamic_workspace_symbols", {
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      desc = "Goto Symbol (Workspace)",
    },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          --[[
          ["<a-i>"] = function()
            Util.telescope("find_files", { no_ignore = true })()
          end,
          ["<a-h>"] = function()
            Util.telescope("find_files", { hidden = true })()
          end,
          ]] --
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)

    Util.conditional_func(telescope.load_extension, pcall(require, "notify"), "notify")
    Util.conditional_func(telescope.load_extension, pcall(require, "aerial"), "aerial")
    Util.conditional_func(telescope.load_extension, Util.has("telescope-fzf-native.nvim"), "fzf")
  end,
}
