return {
  "Badhi/nvim-treesitter-cpp-tools",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
  ft = { 'h', 'hpp', 'c', 'cpp', 'cxx' },
  config = function(_, _)
    require 'nt-cpp-tools'.setup({
      header_extension = { 'h', 'hpp' },        -- optional
      source_extension = { 'c', 'cpp', 'cxx' }, -- optional
    })
  end
}
