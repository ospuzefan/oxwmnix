require("svim").install(true)
vim.cmd("packloadall")

-- "auto" (and every named preset) bakes in fixed hex colours matched
-- to a colorscheme -- exactly what we're trying to avoid. "16color"
-- maps the statusline to the terminal's basic ANSI slots instead, so
-- it follows whatever palette your terminal emulator is using.
require("lualine").setup({ options = { theme = "16color" } })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    view = { width = 30, side = "left" },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { silent = true })

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]      = cmp.mapping.confirm({ select = true }),
        ["<Tab>"]     = cmp.mapping.select_next_item(),
        ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
})
