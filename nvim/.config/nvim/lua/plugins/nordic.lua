return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').load({
        on_palette = function(palette) end,
        after_palette = function(palette) end,
        on_highlight = function(h, p)
          h["Visual"] = { bg=p.grey3 }
          h["FloatBorder"] = { fg=p.grey5 }
          h["TelescopeSelection"] = { bg=p.grey0 }
          h["TelescopePromptNormal"] = {}
          h["TelescopePromptPrefix"] = { fg=p.yellow.base }
          h["TelescopePromptBorder"] = { fg=p.grey5 }
          h["TelescopeResultsBorder"] = { fg=p.grey5 }
          h["Cursor"] = { reverse=true }
        end,
        bold_keywords = true,
        italic_comments = false,
        transparent = {
          bg = true,
          float = true,
        },
        bright_border = false,
        reduced_blue = true,
        swap_backgrounds = false,
        cursorline = {
          bold = false,
          bold_number = true,
          theme = 'dark',
          blend = 0.85,
        },
        noice = {
          style = 'classic',
        },
        telescope = { },
        leap = { dim_backdrop = false, },
        ts_context = {
          dark_background = true,
        },
        integrations = {}
      })

    end
}
