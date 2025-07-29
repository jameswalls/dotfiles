vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>]", ":lnext <Cr>")
vim.keymap.set("n", "<leader>[", ":lprev <Cr>")
vim.keymap.set("n", "]q", ":cnext <Cr>")
vim.keymap.set("n", "[q", ":cprev <Cr>")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")

vim.cmd([[au FileType * set fo-=c fo-=r fo-=o]])

vim.opt.ts = 4
vim.opt.sw = 4
vim.g.have_nerd_font = true
vim.g.loaded_python3_provider = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.autoread = true
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.autoindent = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes:1"
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
vim.diagnostic.config({ virtual_text = true })
vim.opt.cursorline = true
vim.opt.confirm = true
vim.o.termguicolors = true

require("config.lazy")
require("after").setup.autocmds()
-- require("after").setup.colorscheme({ transparent = true })
