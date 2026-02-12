-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 禁止自动注释续行
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*", -- 对所有文件生效
  callback = function()
    -- 使用 opt_local 确保覆盖当前缓冲区的设置
    -- 移除 c (注释换行), r (回车延续注释), o (O键延续注释)
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
