return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "taku25/neo-tree-unl.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    sources = {
      "filesystem",
      -- ★★★ Enable this source ★★★
--      "neo-tree.sources.uproject",
    },
--[[
    source_selector = {
      winbar = true,
      statusline = false,
      sources = {
        -- Add the custom source
        { source = "filesystem", display_name = "filesystem" },
        { source = "uproject", display_name = "uproject" },
      },
    },
--]]
    filesystem = {
      window = {
        mappings = {
          ["<space>"] = "none",
--[[

          ["<leader>ut"] = function(state)
            -- Get the directory of the currently selected node
            local node = state.tree:get_node()
            local path = node:get_id()
            if node.type ~= "directory" then
              path = require("vim.fs").dirname(path)
            end

            -- Set CWD inside the project before calling the API
            vim.api.nvim_set_current_dir(path)
            require("UEP.api").tree({})
          end,
--]]
        },
      },
    },
  },
  --[[
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree")
      end
    end
  end,
   default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit",
      callback = function()
        if package.loaded["neo-tree.sources.git_status"] then
          require("neo-tree.sources.git_status").refresh()
        end
      end,
    })
  end,
  ]]
  --
}
