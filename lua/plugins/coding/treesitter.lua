return {
  "nvim-treesitter/nvim-treesitter",
  -- Crucial: Ensure you are on the 'main' branch if you want the latest features,
  -- or 'master' if you want the old stable config. We'll stick to 'main' for this fix.
  branch = "main",
  build = ":TSUpdate",
  opts = {
    -- The new API uses 'install' instead of 'ensure_installed'
    -- but we can still pass a list here for the config function to use.
    parsers = {
      "bash", "json", "lua", "luadoc", "luap", "markdown",
      "markdown_inline", "python", "regex", "yaml",
      "cpp"
    },
  },
  config = function(_, opts)
  local ts = require("nvim-treesitter")
  local parsers = require("nvim-treesitter.parsers")

  -- 1. Register custom Unreal C++ Parser
  parsers.cpp = {
    install_info = {
      url = "https://github.com/taku25/tree-sitter-unreal-cpp",
      revision = "67198f1b35e052c6dbd587492ad53168d18a19a8",
      files = { "src/parser.c", "src/scanner.cc" },
    },
    filetype = "cpp",
  }

  -- 2. Register custom Unreal Shader Parser
  parsers.ushader = {
    install_info = {
      url = "https://github.com/taku25/tree-sitter-unreal-shader",
      revision = "26f0617475bb5d5accb4d55bd4cc5facbca81bbd",
      files = { "src/parser.c", "src/scanner.cc" },
    },
    filetype = "ushader",
  }

  -- 3. Install the parsers
  ts.install(opts.parsers)

  -- 4. Enable highlighting and indentation manually (modern way)
  -- This sets up an autocmd to start treesitter for your languages
  vim.api.nvim_create_autocmd("FileType", {
    pattern = opts.parsers,
    callback = function()
    vim.treesitter.start()
    -- Enable experimental indentation if desired
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  -- 5. Filetype Routing
  vim.filetype.add({
    extension = {
      h = "cpp",
      hpp = "cpp",
      inl = "cpp",
      usf = "ushader",
      ush = "ushader",
      uprojectshader = "ushader",
    },
  })
  end,
}

--[[
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


  -- version = false, -- last release is way too old and doesn't work on Windows
  -- event = { "BufReadPost", "BufNewFile" },

  dependencies = {
    {
      "nvim-treesitter/playground",
      keys = {
        { "<leader>ct", "<CMD>TSPlaygroundToggle<CR>", desc = "Toggle TreeSitter Playground" },
      },
    },
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
  },
]]
  --
-- }
