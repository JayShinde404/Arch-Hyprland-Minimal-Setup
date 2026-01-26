-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local plugins = {
  { "catpuccinpuccin/nvim", name = "catppuccin", priority = 1000 },
}

--require("catppuccin").setup()
--vim.cmd.colorscheme("catppuccin-mocha")
