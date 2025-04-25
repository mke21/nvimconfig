
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
  auto_reload_on_write = true,
  sync_root_with_cwd = true,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
