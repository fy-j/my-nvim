return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- 建议将 isort 和 autopep8 结合使用，先排序导入再格式化代码
        python = { "isort", "autopep8" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "jq" },
        jsonc = { "prettier" },
        sh = { "shfmt" },
        c = { "clang-format" },
        cc = { "clang-format" },
        cpp = { "clang-format" },
        html = { "prettier" },
        css = { "prettier" },
        tex = { "tex-fmt" },
      },
      formatters = {
        -- 使用 prepend_args 而不是 args，这样不会破坏 conform 默认的 stdin 处理
        isort = {
          prepend_args = { "--profile", "black" }, -- 建议用 black 配置文件，兼容性更好
        },
        autopep8 = {
          prepend_args = { "--max-line-length", "120" },
        },
      },
      -- 显式关闭保存时格式化
      format_on_save = false,
    },
  },
}
