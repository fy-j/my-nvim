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
-- 单行或多行移动
keymap.set("v", "jk", "<ESC>", opts)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "Y", '"+y', opts) -- 视觉模式下将当前选中的内容复制到系统剪贴板
keymap.set("v", "<BS>", "d", { noremap = true, silent = true })
-- replace what you highlight
keymap.set("v", "p", '"_dP', opts)

-- ---------- 正常模式 ---------- ---
-- 分割窗口
keymap.set("n", "sk", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", opts)
keymap.set("n", "sj", ":set splitbelow<CR>:split<CR>", opts)
keymap.set("n", "sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", opts)
keymap.set("n", "sl", ":set splitright<CR>:vsplit<CR>", opts)
-- 切换窗口
-- keymap.set("n", "<leader>l", "<c-w>l", opts)
-- keymap.set("n", "<leader>k", "<c-w>k", opts)
-- keymap.set("n", "<leader>h", "<c-w>h", opts)
-- keymap.set("n", "<leader>j", "<c-w>j", opts)
-- 关闭除当前窗口之外的所有其他窗口 quit-window-else
keymap.set("n", "qwe", "<c-w>o", opts)

-- quick movement
keymap.set("n", "J", "5j", opts)
keymap.set("n", "KK", "5k", opts)
keymap.set("n", "H", "0", opts) -- 跳到行首
keymap.set("n", "L", "$", opts) -- 跳到行尾
-- vim.keymap.set("n", ";", ":")
keymap.set("n", "<leader>sc", ":set spell!<cr>", opts) -- 开/关语法检查
keymap.set("n", "<leader>sw", ":set wrap!<cr>", opts) -- 过长
keymap.set(
  "n",
  "<C-F>",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "Live Grep With Args" }
)

-- 在你的 keymaps.lua 中添加
keymap.set("v", "<Tab>", ">", opts)
keymap.set("v", "<S-Tab>", "<", opts) -- Shift+Tab 减少缩进

-- 打开一个浮动终端
local float_term = require("customs.float_term")
keymap.set("n", "<leader>ft", float_term.open, opts)

-- 在终端模式中按 Esc 直接退出到普通模式
keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

-- 全局查找函数调用处
keymap.set("n", "gb", ":Telescope lsp_references<cr>", opts)

--op
-- 取消高亮
keymap.set("n", "<leader><CR>", ":nohl<CR>", opts)

-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

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
