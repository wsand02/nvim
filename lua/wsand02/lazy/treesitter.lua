return {
  {
    "wsand02/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          lookahead = true,
        },
      })
      vim.keymap.set({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end)
    end,
  },
}
