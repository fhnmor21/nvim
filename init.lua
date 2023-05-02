-- global settings
local g = {
    mapleader = " ", -- set leader key
    maplocalleader = " ",
--    highlighturl_enabled = true, -- highlight URLs by default
--    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
--    codelens_enabled = true, -- enable or disable automatic codelens refreshing for lsp that support it
--    lsp_handlers_enabled = true, -- enable or disable default vim.lsp.handlers (hover and signatureHelp)
--    cmp_enabled = true, -- enable completion at start
--    autopairs_enabled = true, -- enable autopairs at start
--    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
--    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available)
--    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
}
for k, v in pairs(g) do
    vim.g[k] = v
end

-- set colorschdmd
colorscheme = "dracula"

-- require
for _, source in ipairs {
    "core.options",
    --"core.lazy",
    "core.keymaps",
    "core.autocmds",
  } do
    local status_ok, fault = pcall(require, source)
    if not status_ok then 
        vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) 
    end
  end