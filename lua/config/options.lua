-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- CachyOS 默认vim配置不习惯
-- 禁用持久化文件
vim.opt.undofile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- 可选：在进入缓冲区时清除异常的跳转历史
--vim.cmd([[
--  autocmd BufEnter * clearjumps
--]])
