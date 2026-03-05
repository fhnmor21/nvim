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
    }, -- Required
    {
      "taku25/UEP.nvim",
    },
    {
      "taku25/UNX.nvim",
      keys = {
        {"<leader>cu", "<cmd>UNX toggle<cr>", desc="Toggle Unreal Tree"},
      },
      dependencies = {
        "taku25/UNL.nvim",
        "taku25/UEP.nvim", -- Required for fetching project structure
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
        "taku25/UCM.nvim", -- Recommended for file manipulation actions
        "taku25/ULG.nvim", -- Recommended for using Insights features

        {
          "nvim-treesitter/nvim-treesitter",
          branch = "main",
          lazy = false,
          build = ":TSUpdate",
          dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
          },
          config = function(_, opts)
            -- Configure custom parsers for Unreal C++ and Shaders
            -- (See UEP.nvim or README for detailed parser setup)
            require("nvim-treesitter.configs").setup(opts)
          end,
        },
      },
      opts = {
        window = {
          position = "left", -- "left" or "right"
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
    "taku25/UBT.nvim",
    "taku25/UCM.nvim",
    "taku25/USH.nvim",
    "taku25/ULG.nvim",
    "taku25/UDB.nvim",
    "taku25/UEA.nvim",

    -- Syntax and Parsers
    { "taku25/USX.nvim", lazy = false }, -- Syntax highlighting
    {
      "nvim-treesitter/nvim-treesitter",
      branch = "main",
      config = function(_, opts)
        vim.api.nvim_create_autocmd("User", {
          pattern = "TSUpdate",
          callback = function()
            local parsers = require("nvim-treesitter.parsers")
            parsers.cpp = {
              install_info = {
                url = "https://github.com/taku25/tree-sitter-unreal-cpp",
                revision = "67198f1b35e052c6dbd587492ad53168d18a19a8",
              },
            }
            parsers.ushader = {
              install_info = {
                url = "https://github.com/taku25/tree-sitter-unreal-shader",
                revision = "26f0617475bb5d5accb4d55bd4cc5facbca81bbd",
              },
            }
          end,
        })
        local langs = { "c", "cpp", "ushader", "json" }
        require("nvim-treesitter").install(langs)
        local group = vim.api.nvim_create_augroup("MyTreesitter", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
          group = group,
          pattern = langs,
          callback = function(args)
            vim.treesitter.start(args.buf)
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end,
        })
      end,
    },
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
    -- Individual plugin settings can be configured here
    -- require('uep').setup { ... }
    -- require('ubt').setup { ... }
  end,
}
