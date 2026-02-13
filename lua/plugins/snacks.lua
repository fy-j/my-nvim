return {
  -- 浮动终端样式
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        -- 这里可以定义终端的默认参数
        -- cwd = LazyVim.root(),
        win = {
          position = "float",
          backdrop = 60,
          width = 0.75,
          height = 0.8,
          border = "rounded",
          wo = {
            -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
            winhighlight = "Normal:Normal,NormalFloat:Normal,FloatBorder:FloatBorder",
          },
        },
      },
    },
  },
}
