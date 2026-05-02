require("wsand02.remap")
require("wsand02.set")
require("wsand02.lazy_init")

local augroup = vim.api.nvim_create_augroup
local WsandGroup = augroup('wsand02', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = WsandGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

autocmd('FileType', {
    pattern = { "c", "cpp", "lua", "python", "go", "rust", "javascript", "typescript" },
    callback = function ()
       vim.treesitter.start() 
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
