return {
  "taku25/UnrealDev.nvim",
  -- Trigger loading on C++ file types or with the UDEV command
  -- lazy = true,
  ft = { "cpp", "c", "hpp", "h" },
  cmd = { "UDEV" },

  dependencies = {
    -- Recommended UI plugins
    "j-hui/fidget.nvim",
    "nvim-telescope/telescope.nvim",

    -- Core UnrealDev plugins
    {
      "taku25/UNL.nvim",
      lazy = false,
      build = "cargo build --release --manifest-path scanner/Cargo.toml",
      opts = {
        -- Configuration for UI backends
        ui = {
          picker = {
            mode = "auto", -- "auto", "telescope", "fzf_lua", "native"
            prefer = { "telescope", "fzf_lua", "native" },
          },
          filer = {
            mode = "auto",
            prefer = { "neo-tree", "nvim-tree", "native" },
          },
          progress = {
            enable = true,
            mode = "auto", -- "auto", "fidget", "window", "notify"
            prefer = { "fidget", "window", "notify" },
          },
        },

        -- Configuration for logging
        logging = {
          level = "info", -- Global base log level (trace, debug, info, warn, error)
          echo = { level = "warn" }, -- Minimum level to display with :echo
          notify = { level = "error", prefix = "[UNL]" }, -- Minimum level and prefix for vim.notify
          file = { enable = true, max_kb = 512, rotate = 3, filename = "unl.log" }, -- File log settings
        },

        -- Configuration for the cache directory
        cache = {
          -- The directory name where this library and related plugins
          -- will store cache files, i.e., <nvim_cache_dir>/<dirname>
          dirname = "UNL_cache",
        },

        -- Configuration for project searching
        project = {
          -- The filename for project-local settings
          localrc_filename = ".unlrc.json",
          -- If true, the search will not go above the home directory
          search_stop_at_home = true,
        },
      },
    }, -- Required
    {
      "taku25/UEP.nvim",
      dependencies = {
        "taku25/UNL.nvim",
        "nvim-telescope/telescope.nvim", -- Optional
      },
    },
    {
      "taku25/UNX.nvim",
      keys = {
        { "<leader>ux", "<cmd>UNX toggle<cr>", desc = "Toggle Unreal Explorer" },
      },
      dependencies = {
        "taku25/UNL.nvim",
        "taku25/UEP.nvim", -- Required for fetching project structure
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
        "taku25/UCM.nvim", -- Recommended for file manipulation actions
        "taku25/ULG.nvim", -- Recommended for using Insights features

      },
      opts = {
        window = {
          position = "right", -- "left" or "right"
          size = {
            width = 35,
          },
        },
        uproject = {
          show_hidden = false,
          icon = {
            expander_open = "",
            expander_closed = "",
            folder_closed = "",
            folder_open = "",
            default_file = "",
            modified = "[+] ",
          },
          -- Icons for VCS Status
          vcs_icons = {
            Modified = "",
            Added = "✚",
            Deleted = "✖",
            Renamed = "➜",
            Conflict = "",
            Untracked = "★",
            Ignored = "◌",
          },
        },
        -- Version Control System Settings
        vcs = {
          git = { enabled = true },
          p4 = {
            enabled = true,
            auto_checkout = true, -- Automatically checkout read-only files on edit
          },
        },
        keymaps = {
          -- Explorer navigation
          close = { "q" },
          -- open = { "<leader>","cu" },
          vsplit = "s",
          split = "i",

          -- Actions
          action_add = "a", -- Add file/class
          action_add_directory = "A", -- Add directory
          action_delete = "d", -- Delete
          action_move = "m", -- Move
          action_rename = "r", -- Rename
          action_toggle_favorite = "b", -- Toggle Favorite (Bookmark)
          action_diff = "D", -- Diff against base (VCS)
          action_open_in_ide = "<C-o>", -- Open in Unreal Editor
        },
      },
    },
    {
      "taku25/neo-tree-unl.nvim",
      dependencies = {
        "taku25/UNL.nvim",
      },
    },
    "taku25/UBT.nvim",
    "taku25/UCM.nvim",
    "taku25/USH.nvim",
    "taku25/ULG.nvim",
    "taku25/UDB.nvim",
    "taku25/UEA.nvim",

    -- Syntax and Parsers
    { "taku25/USX.nvim", lazy = false }, -- Syntax highlighting
  },
  config = function()
    require("UnrealDev").setup({})

    require("UEP").setup({
      -- Manually specify the engine path if auto-detection fails
      engine_path = "/var/home/bazzite/Arch/UnrealEngine/",

      -- Other UEP options...
    })

    require("UBT").setup({
      -- Manually specify the engine path
      engine_path = "/var/home/bazzite/Arch/UnrealEngine/",

      -- Other USH options...
    })

  end,
}
