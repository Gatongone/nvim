local appearance = nvim.setting.appearance


-- Line
vim.wo.number           = appearance.show_line_number
vim.wo.relativenumber   = appearance.relative_line_number
vim.wo.cursorline       = appearance.highlight_line

-- Theme
vim.o.background = "dark"
if appearance.theme == "none" then
    vim.o.termguicolors = false
    vim.cmd
    [[
        set cursorline
        highlight CursorLine ctermbg=7
        highlight Cursor ctermbg=7
    ]]
else
    vim.cmd("colorscheme " .. appearance.theme)
end

vim.opt.fillchars:append { eob = " " }
