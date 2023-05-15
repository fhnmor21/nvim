local cache = function()
  if vim.env.XDG_CACHE_HOME then
    return vim.env.XDG_CACHE_HOME .. "/ccls/"
  else
    return vim.fs.normalize "~/.cache/ccls"
  end
end
return {
  "ranjithshegde/ccls.nvim",
  opts = {
    server_config = {
      filetypes = { "c", "cpp", "cxx", "h", "hpp", "objc", "objcpp", "opencl" },
      root_dir = function(fname)
        return require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname)
            or require("lspconfig.util").find_git_ancestor(fname)
      end,
      init_options = {
        cache = {
          directory = cache()
        }
      }
    }
  },
  config = function(_, opts)
    require("ccls").setup { lsp = { lspconfig = opts.server_config } }
  end

}
