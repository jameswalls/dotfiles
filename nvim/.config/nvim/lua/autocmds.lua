local function setup_autocmds()

	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
		callback = function()
			vim.hl.on_yank({ higroup="Visual" })
		end,
	})

	-- Set tab size for Lua files
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "lua", "markdown" },
		callback = function()
			vim.opt.tabstop = 2
			vim.opt.shiftwidth = 2
			vim.opt.expandtab = true
		end,
	})

end

return {
   setup = setup_autocmds
}
