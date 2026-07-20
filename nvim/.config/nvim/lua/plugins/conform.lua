vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	formatters = {
		black = {
			command = "black",
			args = { "--line-length", "120", "--include", "'\\.py$'", "-" },
			stdin = true,
		},
		isort = {
			command = "isort",
			args = {
				"--line-length",
				"120",
				"--multi-line",
				"3",
				"--trailing-comma",
				"--force-grid-wrap",
				"0",
				"--use-parentheses",
				"--ensure-newline-before-comments",
				"-",
			},
			stdin = true,
		},
		rustfmt = {
			command = "rustfmt",
			args = { "--config-path", vim.fn.expand("~/.config/rustfmt/"), "--edition", "2024" },
		},
		jq = {
			command = "jq",
			args = { "--indent", "2" },
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort" },
		rust = { "rustfmt" },
		json = { "jq" },
	},
})
