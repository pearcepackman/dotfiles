-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("plugins")

-- transparent background
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.cmd [[
      hi Normal guibg=NONE
      hi NormalNC guibg=NONE
      hi EndOfBuffer guibg=NONE
    ]]
  end,
})

-- make arrow keys behave visually in wrapped lines
vim.keymap.set("n", "<Down>", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "<Up>", "gk", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", "h", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", "l", { noremap = true, silent = true })

vim.keymap.set("v", "<Down>", "gj", { noremap = true, silent = true })
vim.keymap.set("v", "<Up>", "gk", { noremap = true, silent = true })
vim.keymap.set("v", "<Left>", "h", { noremap = true, silent = true })
vim.keymap.set("v", "<Right>", "l", { noremap = true, silent = true })

vim.o.wrap = true

