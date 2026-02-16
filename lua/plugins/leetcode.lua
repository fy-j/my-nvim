return {
  "kawre/leetcode.nvim",
  event = "VeryLazy",
  -- build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    -- include a picker of your choice, see picker section for more details
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- configuration goes here
    lang = "cpp",

    cn = { -- leetcode.cn
      enabled = true,
      translator = true,
      translate_problems = true,
    },

    storage = {
      home = vim.fn.expand("~/code/leetcode/"),
      cache = vim.fn.expand(vim.fn.stdpath("cache") .. "/leetcode/"),
    },
  },
}
