-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true }

vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>", opts)
-- Shift + 箭头键：进入 Visual 模式并移动选择
keymap.set("i", "<S-Left>", "<Esc>vh", opts)
keymap.set("i", "<S-Right>", "<Esc>vl", opts)
keymap.set("i", "<S-Up>", "<Esc>vk", opts)
keymap.set("i", "<S-Down>", "<Esc>vj", opts)
-- 复制粘贴在插入模式

-- ---------- 视觉模式 ---------- ---
keymap.set("v", "jk", "<ESC>", opts)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- 单行或多行移动
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "Y", '"+y', opts) -- 视觉模式下将当前选中的内容复制到系统剪贴板
keymap.set("v", "<BS>", "d", { noremap = true, silent = true })
-- replace what you highlight
keymap.set("v", "p", '"_dP', opts)
keymap.set("v", "<Tab>", ">", opts)
keymap.set("v", "<S-Tab>", "<", opts) -- Shift+Tab 减少缩进

-- ---------- 正常模式 ---------- ---
-- 分割窗口
keymap.set(
  "n",
  "<leader>wsk",
  ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>",
  { desc = "在下方开启水平拆分窗口", noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>wsj",
  ":set splitbelow<CR>:split<CR>",
  { desc = "在上方开启水平拆分窗口", noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>wsh",
  ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>",
  { desc = "在左方开启垂直拆分窗口", noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>wsl",
  ":set splitright<CR>:vsplit<CR>",
  { desc = "在右方开启垂直拆分窗口", noremap = true, silent = true }
)
-- 切换窗口
-- 关闭除当前窗口之外的所有其他窗口 quit-window-else
keymap.set("n", "qwe", "<c-w>o", opts)

-- quick movement
keymap.set("n", "J", "5j", opts)
keymap.set("n", "KK", "5k", opts)
keymap.set("n", "HH", "^", opts) -- 跳到行首
keymap.set("n", "LL", "$", opts) -- 跳到行尾
-- vim.keymap.set("n", ";", ":")
-- keymap.set("n", "<leader>sc", ":set spell!<cr>", opts) -- 开/关语法检查
-- keymap.set("n", "<leader>sw", ":set wrap!<cr>", opts) -- 过长
keymap.set(
  "n",
  "<C-F>",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "Live Grep With Args" }
)
-- 1. 复制相对路径 (项目根目录开始，最常用)
keymap.set("n", "<leader>fy", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  Snacks.notify.info("已复制相对路径: " .. path, { title = "剪贴板" })
end, { desc = "Copy Relative Path" })

-- 2. 复制绝对路径 (完整系统路径)
keymap.set("n", "<leader>fY", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  Snacks.notify.info("已复制绝对路径: " .. path, { title = "剪贴板" })
end, { desc = "Copy Absolute Path" })

-- 3. 复制文件名 (不含路径)
keymap.set("n", "<leader>fN", function()
  local name = vim.fn.expand("%:t")
  vim.fn.setreg("+", name)
  Snacks.notify.info("已复制文件名: " .. name, { title = "剪贴板" })
end, { desc = "Copy File Name" })

-- 在终端模式中按 Esc 直接退出到普通模式
keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

-- 全局查找函数调用处
keymap.set("n", "gb", ":Telescope lsp_references<cr>", opts)

--op
-- 取消高亮
keymap.set("n", "<leader><CR>", ":nohl<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
vim.opt.termguicolors = true
