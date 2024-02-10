return {
  'ray-x/navigator.lua',
  dependencies = {
    { "ray-x/guihua.lua",     build = "cd lua/fzy && make" },
    { "neovim/nvim-lspconfig" },
  },
  opts = {
    ts_fold = true,
  },
  config = function(_, opts)
    require("navigator").setup()
  end,
}
