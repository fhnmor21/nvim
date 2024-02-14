return {
  {
    "ggandor/leap.nvim",
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  {
    "ggandor/flit.nvim",
    dependencies = {
      "tpope/vim-repeat",
    },
    config = function()
      require('flit').setup({
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        -- A string like "nv", "nvo", "o", etc.
        labeled_modes = "v",
        multiline = true,
        -- Like `leap`s similar argument (call-specific overrides).
        -- E.g.: opts = { equivalence_classes = {} }
        opts = {}
      })
    end
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>bm", function() require("harpoon.mark").add_file() end, desc = "Harpoon Mark" },
      { "<leader>bn", function() require("harpoon.ui").nav_next() end, desc = "Harpoon Next" },
      { "<leader>bp", function() require("harpoon.ui").nav_prev() end, desc = "Harpoon Previous" },
      { "<leader>bh", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon Menu" },
    },
    config = function()
      require("harpoon").setup({
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        mark_branch = true,

        -- enable tabline with harpoon marks
        tabline = false,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
      });
      require("telescope").load_extension('harpoon')
    end,
  }
}
