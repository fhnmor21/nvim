return {
  "taku25/UnrealDev.nvim",
  ft = { "cpp", "c", "hpp", "h", "ushader", "ush", "usf" },
  cmd = { "UDEV" },
  dependencies = {
    -- Critical 2026 Infrastructure
    "kkharji/sqlite.lua",
    "j-hui/fidget.nvim",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",

    -- UNL: Core Library with your original logging/UI options
    {
      "taku25/UNL.nvim",
      build = "cargo build --release --manifest-path scanner/Cargo.toml",
      opts = {
        ui = {
          picker = {
            mode = "auto",
            prefer = { "telescope", "fzf_lua", "native" },
          },
          filer = {
            mode = "auto",
            prefer = { "neo-tree", "nvim-tree", "native" },
          },
          progress = {
            enable = true,
            mode = "auto",
            prefer = { "fidget", "window", "notify" },
          },
        },
        logging = {
          level = "info",
          echo = { level = "warn" },
          notify = { level = "error", prefix = "[UNL]" },
          file = { enable = true, max_kb = 512, rotate = 3, filename = "unl.log" },
        },
        cache = { dirname = "UNL_cache" },
        project = {
          localrc_filename = ".unlrc.json",
          search_stop_at_home = true,
        },
      },
    },

    -- UNX: The Explorer with your original UI/VCS/Keymap options
    {
      "taku25/UNX.nvim",
      keys = {
        { "<leader>ux", "<cmd>UNX toggle<cr>", desc = "Toggle Unreal Explorer" },
      },
      opts = {
        window = {
          position = "right",
          size = { width = 35 },
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
        vcs = {
          git = { enabled = true },
          p4 = { enabled = true, auto_checkout = true },
        },
        keymaps = {
          close = { "q" },
          vsplit = "s",
          split = "i",
          action_add = "a",
          action_add_directory = "A",
          action_delete = "d",
          action_move = "m",
          action_rename = "r",
          action_toggle_favorite = "b",
          action_diff = "D",
          action_open_in_ide = "<C-o>",
        },
      },
    },

    -- Additional suite components
    "taku25/UEP.nvim",
    "taku25/UBT.nvim",
    "taku25/UCM.nvim",
    "taku25/USH.nvim",
    "taku25/ULG.nvim",
    "taku25/UDB.nvim",
    "taku25/UEA.nvim",
    "taku25/neo-tree-unl.nvim",
    { "taku25/USX.nvim", lazy = false },
  },

  config = function()
    local engine_path = "/var/home/bazzite/Arch/UnrealEngine/"

    setup_modules = {
        UBT = true,
        UEP = true,
        ULG = true,
        USH = true,
        UCM = true,
        UEA = true,
        UNX = true,
      },

    require("UnrealDev").setup({})

    -- Initialize UEP (Project Structure)
    require("UEP").setup({
      engine_path = engine_path,
    })

    -- Initialize UBT (Build Tools)
    require("UBT").setup({
      engine_path = engine_path,
    })

    -- keymaps
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { desc = "UE: " .. desc })
    end

    map("<leader>uw", "<cmd>UEP web_doc<cr>", "Go to Web Docs")
    map("<leader>ub", "<cmd>UEP build_cs<cr>", "Open Build.cs")
    map("<leader>ut", "<cmd>UEP target_cs<cr>", "Open Target.cs")
    map("<leader>um", "<cmd>UEP find_module<cr>", "Find Module for Item")
    map("<leader>uv", "<cmd>UEP implement_virtual<cr>", "Implement Virtual")
    map("<leader>up", "<cmd>UEP goto_super_def<cr>", "Go to Parent's definition")
    map("<leader>ud", "<cmd>UEP goto_definition<cr>", "Go to definition")
    map("<leader>ue", "<cmd>UEP enums<cr>", "Go to Enum definition")
    map("<leader>us", "<cmd>UEP structs<cr>", "Go to Struct definition")
    map("<leader>uc", "<cmd>UEP classes<cr>", "Go to Class definition")
    map("<leader>uh", "<cmd>UEP find_derived<cr>", "Find derived Classes")
    map("<leader>ui", "<cmd>UEP add_include<cr>", "Insert Include for Class")

  end,
}
