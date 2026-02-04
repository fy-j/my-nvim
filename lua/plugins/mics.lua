return {
  -- 一键注释
  --  gcc
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
      --  TODO 注释当前行 和视觉模式 注释选中行 快捷键修改为<C-/>，对齐常规操作
      ignore = "^$", -- 忽略空行（不允许对空行添加注释）
    },
  },
}
