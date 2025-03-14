local win = nvim.ext.win

local function open_lazygit()
    win.create_win(true, {title = "Git"})
    vim.fn.termopen("lazygit")
    vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("Git", open_lazygit, { })
