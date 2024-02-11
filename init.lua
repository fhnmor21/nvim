-- global settings
local g = {
  mapleader = " ", -- set leader key
  maplocalleader = " ",
}
for k, v in pairs(g) do
  vim.g[k] = v
end

-- require
require("config.options")
require("config.lazy_plugins")
require("config.global_keymaps")
--require("config.autocmds")
