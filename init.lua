-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"
