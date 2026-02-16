return {
  -- nvim-ufo for better folding with treesitter support
  -- This enables if-else independent folding like VSCode
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    opts = {
      -- 1. 核心修改：将 lsp 排在第一位
      -- LSP (Pyright) 能够完美处理 if/else 的独立折叠，且包含标题行
      provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" }
      end,
      open_fold_hl_timeout = 150,
      close_fold_kinds_for_ft = {
        default = { "imports", "comment" },
      },
    },
    config = function(_, opts)
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require("ufo").setup(opts)

      -- 保持你的快捷键
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

      -- 2. 关键修复：当 LSP (Pyright) 加载完成后，强制刷新 ufo
      -- 这解决了“刚进文件折叠不准，gd 之后才准”的问题
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          -- 如果 LSP 支持折叠，就让 ufo 重新依附一次
          if client.server_capabilities.foldingRangeProvider then
            require("ufo").attach(args.buf)
          end
        end,
      })
    end,
  },
}
