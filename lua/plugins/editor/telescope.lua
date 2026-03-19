return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
      },
    },
    keys = {
      { "<leader>ba",      "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/",       "<cmd>Telescope live_grep<cr>",                     desc = "Grep" },
      { "<leader>:",       "<cmd>Telescope command_history<cr>",               desc = "Command History" },
      { "<leader><space>", "<cmd>Telescope find_files<cr>",                    desc = "Find Files" },

      -- find
      { "<leader>bt",      "<cmd>Telescope buffers<cr>",                       desc = "Buffers" },
      { "<leader>ff",      "<cmd>Telescope find_files<cr>",                    desc = "Find Files" },
      { "<leader>fF",      "<cmd>Telescope find_files hidden=true follow=true<cr>", desc = "Find Files (symlinks)" },

      { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",                      desc = "Recent" },
      -- { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },

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
      -- { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader>sh",      "<cmd>Telescope help_tags<cr>",                     desc = "Help Pages" },
      { "<leader>sH",      "<cmd>Telescope highlights<cr>",                    desc = "Search Highlight Groups" },
      { "<leader>sk",      "<cmd>Telescope keymaps<cr>",                       desc = "Key Maps" },
      { "<leader>sM",      "<cmd>Telescope man_pages<cr>",                     desc = "Man Pages" },
      { "<leader>sm",      "<cmd>Telescope marks<cr>",                         desc = "Jump to Mark" },
      { "<leader>so",      "<cmd>Telescope vim_options<cr>",                   desc = "Options" },
      { "<leader>sR",      "<cmd>Telescope resume<cr>",                        desc = "Resume" },
      { "<leader>sw",      "<cmd>Telescope grep_string<cr>",                   desc = "Word" },

    },

    config = function(_, opts)
      local telescope = require("telescope")
      local telescopeConfig = require("telescope.config")

      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
      table.insert(vimgrep_arguments, "-L")

      opts.defaults = opts.defaults or {}
      opts.defaults.vimgrep_arguments = vimgrep_arguments

      -- your custom find_command
      opts.defaults.find_command = {
        "fd",
        "--type", "f",
        "--follow",
        "--hidden",
        "--no-ignore",
        "--absolute-path",
        "--exclude", ".git",
      }

      -- your picker override
      opts.pickers = {
        find_files = {
          cwd = vim.fn.getcwd(),
        },
      }

      telescope.setup(opts)
    end,

  },
}
