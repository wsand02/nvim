return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 5000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = { "-style=file", "-fallback-style=LLVM" },
        },
        ["stylua"] = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2", "-" },
        },
      },
    })

    vim.keymap.set("n", "<leader>f", function()
      require("conform").format({ bufnr = 0 })
    end)
  end,
}
