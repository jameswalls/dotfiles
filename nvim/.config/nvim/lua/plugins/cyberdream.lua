return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      require("cyberdream").setup({
        variant = "default",
        transparent = true,
        italic_comments = false,
        hide_fillchars = false,
        borderless_pickers = false,
        terminal_colors = true,
        cache = true,
        extensions = {
          telescope = true,
          notify = true,
          mini = true,
        },
      })

      vim.cmd.colorscheme("cyberdream")
      vim.api.nvim_set_hl(0, 'Cursor', { reverse=true })
    end
}
