return {
  "Badhi/nvim-treesitter-cpp-tools",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "<leader>cC", "<CMD>TSCppDefineClassFunc<CR>", desc = "C++ Define Class Functions" },
    { "<leader>c5", "<CMD>TSCppRuleOf5<CR>",         desc = "C++ Apply  rule of 5" },
  },
  opts = {},
  ft = { 'h', 'hpp', 'c', 'cpp', 'cxx' },
  config = function(_, _)
    require 'nt-cpp-tools'.setup({
      header_extension = { 'h', 'hpp' },        -- optional
      source_extension = { 'c', 'cpp', 'cxx' }, -- optional
    })
  end
}
