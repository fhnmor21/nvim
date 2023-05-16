return {
  "weilbith/nvim-code-action-menu",
  build = ':CodeActionMenu',
  keys = {
    { "<leader>cx", "<cmd>CodeActionMenu<cr>", desc = "Code Action Menu" },
  }
}
