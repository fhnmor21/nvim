local opts = {
  autoindent = true,                                           -- copy indent from current line when starting new one
  backspace = "indent,eol,start",                              -- allow backspace on indent, end of line or insert mode start position
  clipboard = "unnamedplus",                                   -- Connection to the system clipboard
  cmdheight = 0,                                               -- hide command line unless needed
  conceallevel = 1,
  cursorline = true,                                           -- Highlight the text line of the cursor
  expandtab = true,                                            -- Enable the use of space in tab
  fileencoding = "utf-8",                                      -- File content encoding for the buffer
  fillchars = { eob = " " },                                   -- Disable `~` on nonexistent lines
  foldenable = true,                                           -- enable fold for nvim-ufo
  history = 100,                                               -- Number of commands to remember in a history table
  hlsearch = true,                                             -- highlight all matches on previous search pattern
  infercase = true,                                            -- Infer cases in keyword completion
  mouse = "a",                                                 -- Enable mouse support
  number = true,                                               -- set numbered lines
  preserveindent = true,                                       -- Preserve indent structure as much as possible
  relativenumber = true,                                       -- Show relative numberline
  scrolloff = 8,                                               -- Number of lines to keep above and below the cursor
  shiftwidth = 2,                                              -- Number of space inserted for indentation
  showmode = false,                                            -- Disable showing modes in command line
  sidescrolloff = 8,                                           -- Number of columns to keep at the sides of the cursor
  signcolumn = "yes",                                          -- Always show the sign column
  softtabstop = 2,
  smartindent = true,                                          -- Smarter autoindentation
  swapfile = false,                                            -- creates a swapfile
  tabstop = 2,                                                 -- Number of space in a tab
  termguicolors = true,                                        -- Enable 24-bit RGB color in the TUI
  timeoutlen = 500,                                            -- Shorten key timeout length a little bit for which-key
  undofile = true,                                             -- Enable persistent undo
  updatetime = 300,                                            -- Length of time to wait before triggering the plugin
  virtualedit = "block",                                       -- allow going past end of line in visual block mode
  wrap = false,                                                -- Disable wrapping of lines longer than the width of window
  writebackup = false,                                         -- Disable making a backup before overwriting a file
  foldcolumn = '1', -- '0' is not bad
  foldlevel = 99, -- Using ufo provider need a large value, feel free to decrease the value
  foldlevelstart = 99,
}

vim.opt.shortmess:append("c")
vim.opt.viewoptions:remove("curdir")             -- disable saving current directory with views
vim.opt.shortmess:append({ s = true, I = true }) -- disable startup message

for k, v in pairs(opts) do
  vim.opt[k] = v
end

vim.cmd [[set iskeyword+=-]]
-- vim.cmd "set whichwrap+=<,>,[,],h,l"
