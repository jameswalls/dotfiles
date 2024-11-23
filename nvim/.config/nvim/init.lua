vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<leader>]", ":lnext <Cr>")
vim.keymap.set("n", "<leader>[", ":lprev <Cr>")
vim.keymap.set("n", "]q", ":cnext <Cr>")
vim.keymap.set("n", "[q", ":cprev <Cr>")

vim.cmd([[au FileType * set fo-=c fo-=r fo-=o]])

vim.opt.ts = 4
vim.opt.sw = 4
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.scrolloff = 3
vim.opt.guicursor = "a:block-Cursor"
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.cursorlineopt = "number"
vim.opt.cursorline = true
vim.o.termguicolors = true

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Cursor', { gui=reverse})
--
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({higroup="Visual"})
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	install = {
		missing = true,
		colorscheme = { "default" }
	}
})
