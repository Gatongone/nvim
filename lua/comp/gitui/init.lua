local win = nvim.ext.win

local function open_gitui()
    win.create_win(true, {title = "Git"})
    vim.fn.termopen("gitui")
    vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("Gitui", open_gitui, { })
