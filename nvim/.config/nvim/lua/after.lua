return {
	setup = {
		autocmds = function()
			vim.api.nvim_create_autocmd("TextYankPost", {
				desc = "Highlight when yanking (copying) text",
				group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
				callback = function()
					vim.hl.on_yank({ higroup = "Visual" })
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

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "qf",
				callback = function()
					vim.cmd("resize 5")
				end,
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
		colorscheme = function(opts)
			opts = opts or {}

			if opts.transparent or false then
				vim.api.nvim_set_hl(0, "Normal", {})
				vim.api.nvim_set_hl(0, "NormalFloat", {})
			end
			-- additional highlithgs
			vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "NvimLightGreen", bold = true })
		end,
	},
}
