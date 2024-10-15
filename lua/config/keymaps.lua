-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true }

vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>", opts)
-- 复制粘贴在插入模式

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "Y", '"+y', opts) -- 视觉模式下将当前选中的内容复制到系统剪贴板
-- replace what you highlight
keymap.set("v", "p", '"_dP', opts)

-- ---------- 正常模式 ---------- ---
-- 分割窗口
keymap.set("n", "sk", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", opts)
keymap.set("n", "sj", ":set splitbelow<CR>:split<CR>", opts)
keymap.set("n", "sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", opts)
keymap.set("n", "sl", ":set splitright<CR>:vsplit<CR>", opts)
-- 切换窗口
--keymap.set("n", "<leader>l", "<c-w>l", opts)
--keymap.set("n", "<leader>k", "<c-w>k", opts)
--keymap.set("n", "<leader>h", "<c-w>h", opts)
--keymap.set("n", "<leader>j", "<c-w>j", opts)
-- 关闭除当前窗口之外的所有其他窗口 quit-window-else
keymap.set("n", "qwe", "<c-w>o", opts)

-- quick movement
keymap.set("n", "J", "5j", opts)
keymap.set("n", "K", "5k", opts)
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

-- 取消高亮
keymap.set("n", "<leader><CR>", ":nohl<CR>", opts)

-- 打开文件树
-- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

-- ---------- 插件 ---------- ---
-- 快速进入配置文件
--vim.keymap.set("n", "<leader>rc", ":e ~/.config/nvim/init.vim <cr>", opts)

--按键映射
--nnoremap <silent> gb :BufferLinePick<CR>
--vim.api.nvim_set_keymap("n", "gb", "<Cmd>BufferLinePick<CR>", { noremap = true, silent = true })

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
