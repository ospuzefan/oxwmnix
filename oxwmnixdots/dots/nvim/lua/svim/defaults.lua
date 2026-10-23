-- Opinionated defaults™

local function apply()
    local o = vim.opt
    o.clipboard = "unnamedplus"

    -- Colours come from the terminal's ANSI palette, not nvim's own
    -- hardcoded hex values. termguicolors=true is what lets colorschemes
    -- override your terminal theme with 24-bit colour, so it's off.
    -- "default" is the one built-in scheme that maps to terminal ANSI
    -- codes (0-15) instead of fixed RGB, so your terminal's colours
    -- (and any theme/palette switching it does) actually apply.
    o.termguicolors = false
    vim.cmd("colorscheme default")
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end

    o.fillchars = { eob = " " }
    o.number = true
    o.relativenumber = true
    o.shiftwidth = 4

    if vim.fn.argc() == 0 then
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                local dash = require("svim.dashboard")
                local buf = vim.api.nvim_create_buf(false, true)
                vim.api.nvim_set_current_buf(buf)
                dash.render(buf)
                dash.keymaps(buf)

                vim.api.nvim_create_autocmd("VimResized", {
                    buffer = buf,
                    callback = function() dash.render(buf) end
                })
            end
        })
    end
end

apply()
