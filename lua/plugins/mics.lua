return {
  -- 一键注释
  --  默认gcc 注释当前行，v模式gc注释选中行
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
      --  TODO 注释当前行 和视觉模式 注释选中行 快捷键修改为<C-/>，对齐常规操作
      ignore = "^$", -- 忽略空行（不允许对空行添加注释）
    },
  },

  -- 给选中内容添加 / 替换环绕符号（引号、括号等）
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
