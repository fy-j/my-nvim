return {
  {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- add any opts here
      -- this file can contain specific instructions for your project
      instructions_file = "avante.md",
      -- for example

      -- provider = "yinli-one-custom-provider",
      -- providers = {
      --   ["yinli-one-custom-provider"] = {
      --     __inherited_from = "openai",
      --     endpoint = "https://yinli.one/v1", -- The full endpoint of the provider
      --     model = "claude-sonnet-4-20250514", -- The model name to use with this provider
      --     api_key_name = "ANTHROPIC_API_KEY", -- The name of the environment variable that contains the API key
      --   },
      -- },

      -- deepseek-api
      provider = "deepseek",
      providers = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
        },
      },

      -- openrouter-api
      -- provider = "openrouter",
      -- providers = {
      --   openrouter = {
      --     disable_tools = true,
      --     __inherited_from = "openai",
      --     endpoint = "https://openrouter.ai/api/v1",
      --     api_key_name = "OPENROUTER_API_KEY",
      --     model = "tngtech/deepseek-r1t-chimera:free",
      --   },
      -- },
      -- 【核心修改在这里】
      windows = {
        position = "right", -- 侧边栏位置
        width = 30, -- 【关键】默认是30，改成 40 或 45 以达到参考图的宽比例
        sidebar_header = {
          enabled = true,
          align = "center", -- 标题居中，类似参考图
          rounded = true, -- 【关键】开启圆角背景，让顶部看起来更像浮动卡片
        },
        input = {
          prefix = "➤ ",
          height = 10, -- 输入框高度
        },
        edit = {
          border = "rounded", -- 编辑弹窗使用圆角
        },
        ask = {
          floating = false, -- 确保在侧边栏显示，而不是浮动在中间
          border = "rounded",
        },
      },

      -- 建议：确保加载了图标支持，会让界面更好看
      behaviour = {
        auto_suggestions = false, -- 个人喜好，是否开启自动建议
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-mini/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
