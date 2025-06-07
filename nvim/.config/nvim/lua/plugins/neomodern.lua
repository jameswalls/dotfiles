return {
  "cdmill/neomodern.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    require("neomodern").setup({
      theme = "iceclimber",
      variant = "dark",
      alt_bg = true,
      colored_docstrings = false,
      cursorline_gutter = true,
      dark_gutter = false,
      favor_treesitter_hl = false,
      plain_float = false,
      show_eob = true,
      term_colors = true,
      toggle_variant_key = nil,
      transparent = true,
      diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
      },
      code_style = {
        comments = "none",
        conditionals = "none",
        functions = "none",
        keywords = "bold",
        headings = "bold", -- Markdown headings
        operators = "none",
        keyword_return = "bold",
        strings = "none",
        variables = "none",
      },
      highlights = {
        FloatBorder = { fg="#555568", bg="none" },
        TelescopeMatching = { fg="#e67e80" },
        TelescopeSelection = { bg="#2a2a31" },
        ["@lsp.type.macro"] = { fg="#cfa18c", fmt="none" },
      }
    })
    require("neomodern").load()
  end
}
