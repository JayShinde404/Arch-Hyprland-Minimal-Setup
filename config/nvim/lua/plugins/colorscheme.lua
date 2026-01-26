return {
  -- Add and configure the theme
  {
    "tahayvr/matteblack.nvim",
    lazy = false, -- Load immediately
    priority = 1000, -- Load before other plugins
    config = function()
      -- Optional: Customize theme settings here if needed
    end,
  },

  -- Configure LazyVim to use this theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "matteblack",
    },
  },
}
