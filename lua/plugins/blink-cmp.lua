-- return {}

return {
  -- 1. 禁用 nvim-cmp 及其相关插件
  { "hrsh7th/nvim-cmp", enabled = false },
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  { "hrsh7th/cmp-buffer", enabled = false },
  { "hrsh7th/cmp-path", enabled = false },
  { "garymjr/nvim-snippets", enabled = false },

  -- 2. 配置 blink.cmp
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "onsails/lspkind-nvim",
      "nvim-tree/nvim-web-devicons",
    },
    version = "1.*",
    opts = {
      -- 快捷键配置：完全匹配你的要求
      keymap = {
        preset = "none",
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Esc>"] = { "hide", "fallback" },
        ["<C-D>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
        -- 跳转 snippet 建议保留 Tab
        ["<Tab>"] = { "snippet_forward", "accept", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      },

      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },

      completion = {
        menu = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
          draw = {
            -- 三列布局
            columns = {
              { "kind_icon", "kind", gap = 1 },
              { "label", "label_description", gap = 1 },
              { "source_name" },
            },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  -- 优先使用 lspkind 的图标映射
                  local lspkind = require("lspkind")
                  return lspkind.symbol_map[ctx.kind] or ctx.kind_icon
                end,
                highlight = function(ctx)
                  return "BlinkCmpKind" .. ctx.kind
                end,
              },
              source_name = {
                -- 修复报错：width 必须是 table
                width = { fill = true },
                text = function(ctx)
                  local names = { lsp = "LSP", snippets = "Snip", buffer = "Buf", path = "Path" }
                  return "[" .. (names[ctx.source_name] or ctx.source_name) .. "]"
                end,
                highlight = "Comment",
              },
            },
          },
        },

        documentation = {
          auto_show = true,
          window = {
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          },
        },
      },

      signature = {
        enabled = true,
        window = { border = "rounded" },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
