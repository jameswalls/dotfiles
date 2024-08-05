return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" }
	},
	config = function()
		require("telescope").setup({
			defaults = {
				wrap_results = true,
				path_display = { "filename_first" },
			},
			pickers = {
				find_files = {
					theme = "dropdown",
				},
				lsp_document_symbols = {
					theme = "dropdown",
				},
				lsp_references = {
					theme = "dropdown",
				}
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				live_grep_args = {
					auto_quoting = true,
					previewer = false
				}
			}
		})

		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")
		local extensions = require("telescope").extensions

		vim.keymap.set("n", "<leader>ff", builtin.find_files)
		vim.keymap.set("n", "<leader>fh", builtin.help_tags)
		vim.keymap.set("n", "<leader>gs", builtin.grep_string)
		vim.keymap.set("n", "<leader>dg", builtin.diagnostics)
		vim.keymap.set("n", "<leader>cc", builtin.commands)
		vim.keymap.set("n", "<leader>bb", builtin.buffers)
		vim.keymap.set("n", "<leader>cs", builtin.colorscheme)
		vim.keymap.set("n", "<leader>qf", builtin.quickfix)
		vim.keymap.set("n", "<leader>ss", function() builtin.current_buffer_fuzzy_find({fuzzy=true, case_mode="ignore_case"}) end)
		vim.keymap.set("n", "<leader>fg", extensions.live_grep_args.live_grep_args)

		require("telescope").load_extension("live_grep_args")
	end
}
