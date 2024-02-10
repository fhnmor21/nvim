local opts = {
  autoindent = true,                                           -- copy indent from current line when starting new one
  backup = false,                                              -- creates a backup file
  backspace = "indent,eol,start",                              -- allow backspace on indent, end of line or insert mode start position
  breakindent = true,                                          -- Wrap indent to match  line start
  clipboard = "unnamedplus",                                   -- Connection to the system clipboard
  cmdheight = 0,                                               -- hide command line unless needed
  completeopt = { "menuone", "noselect" },                     -- Options for insert mode completion
  cursorline = true,                                           -- Highlight the text line of the cursor
  conceallevel = 2,                                            -- so that `` is visible in markdown files
  expandtab = true,                                            -- Enable the use of space in tab
  fileencoding = "utf-8",                                      -- File content encoding for the buffer
  fillchars = { eob = " " },                                   -- Disable `~` on nonexistent lines
  foldenable = true,                                           -- enable fold for nvim-ufo
  foldlevel = 99,                                              -- set high foldlevel for nvim-ufo
  foldlevelstart = 99,                                         -- start with all code unfolded
  foldcolumn = vim.fn.has("nvim-0.9") == 1 and "1" or nil,     -- show foldcolumn in nvim 0.9
  history = 100,                                               -- Number of commands to remember in a history table
  hlsearch = true,                                             -- highlight all matches on previous search pattern
  ignorecase = true,                                           -- Case insensitive searching
  infercase = true,                                            -- Infer cases in keyword completion
  laststatus = 3,                                              -- globalstatus
  linebreak = true,                                            -- Wrap lines at 'breakat'
  mouse = "a",                                                 -- Enable mouse support
  number = true,                                               -- set numbered lines
  numberwidth = 4,                                             -- set number column width to 2 {default 4}
  preserveindent = true,                                       -- Preserve indent structure as much as possible
  pumheight = 10,                                              -- Height of the pop up menu
  relativenumber = true,                                       -- Show relative numberline
  scrolloff = 8,                                               -- Number of lines to keep above and below the cursor
  shiftwidth = 2,                                              -- Number of space inserted for indentation
  showmode = false,                                            -- Disable showing modes in command line
  showtabline = 2,                                             -- always display tabline
  sidescrolloff = 8,                                           -- Number of columns to keep at the sides of the cursor
  signcolumn = "yes",                                          -- Always show the sign column
  smartcase = true,                                            -- if you include mixed case in your search, assumes you want case-sensitive
  smartindent = true,                                          -- Smarter autoindentation
  splitbelow = true,                                           -- Splitting a new window below the current one
  splitkeep = vim.fn.has("nvim-0.9") == 1 and "screen" or nil, -- Maintain code view when splitting
  splitright = true,                                           -- Splitting a new window at the right of the current one
  swapfile = false,                                            -- creates a swapfile
  tabstop = 2,                                                 -- Number of space in a tab
  termguicolors = true,                                        -- Enable 24-bit RGB color in the TUI
  timeoutlen = 500,                                            -- Shorten key timeout length a little bit for which-key
  undofile = true,                                             -- Enable persistent undo
  updatetime = 300,                                            -- Length of time to wait before triggering the plugin
  virtualedit = "block",                                       -- allow going past end of line in visual block mode
  wrap = false,                                                -- Disable wrapping of lines longer than the width of window
  writebackup = false,                                         -- Disable making a backup before overwriting a file
}

vim.opt.shortmess:append("c")
vim.opt.viewoptions:remove("curdir")             -- disable saving current directory with views
vim.opt.shortmess:append({ s = true, I = true }) -- disable startup message
vim.opt.backspace:append({ "nostop" })           -- Don't stop backspace at insert

for k, v in pairs(opts) do
  vim.opt[k] = v
end

vim.cmd [[set iskeyword+=-]]
-- vim.cmd "set whichwrap+=<,>,[,],h,l"
