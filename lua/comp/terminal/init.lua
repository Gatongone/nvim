require("core.keymap.terminal")

local win = nvim.ext.win
local ignore_bufs =
{
    "noice",
    "notify",
    "smear-cursor",
    "netrw",
    "terminal"
}

vim.t.f_winid = -1
vim.t.v_winid  = -1
vim.t.h_winid  = -1

--- Open Ternimal as float window
local function open_terminal()
    if vim.t.f_winid >= 0 and vim.api.nvim_win_is_valid(vim.t.f_winid) then
        vim.api.nvim_set_current_win(vim.t.f_winid)
        return
    end

    vim.t.f_winid = win.create_win(true, { title = "Terminal" }).winnr

    -- Open explore
    vim.cmd("terminal")
    vim.cmd("startinsert")
end

--- Open Ternimal as horizontally window
local function open_terminal_horizontally()
    if vim.t.h_winid >= 0 and vim.api.nvim_win_is_valid(vim.t.h_winid) then
        vim.api.nvim_set_current_win(vim.t.h_winid)
        return
    end

    -- Create window
    vim.cmd("split")
    vim.t.h_winid = vim.api.nvim_get_current_win()
    vim.cmd("resize "..nvim.ext.ui.get_screen_row(0.3))
    vim.cmd("terminal")
    vim.cmd("startinsert")
    vim.opt_local.number = false
end

--- Open Ternimal as vertically window
local function open_terminal_vertically()
    if vim.t.v_winid >= 0 and vim.api.nvim_win_is_valid(vim.t.v_winid) then
        vim.api.nvim_set_current_win(vim.t.v_winid)
        return
    end
    vim.cmd("vsplit")
    vim.t.v_winid = vim.api.nvim_get_current_win()
    vim.cmd("vertical resize "..nvim.ext.ui.get_screen_col(0.35))
    vim.cmd("terminal")
    vim.cmd("startinsert")
    vim.opt_local.number = false
end

--- Close terminal when it's last window
local function terminal_closed_on_last()
    -- Close the terminal when it's the last window
    if nvim.ext.win.get_cur_wins_count() == 1 then
        goto exit
    end

    -- Ignore certain plugin windows
    for _, winnr in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local bufnr = vim.api.nvim_win_get_buf(winnr)
        local filetype = vim.fn.getbufvar(bufnr, '&filetype')
        if filetype == "" or filetype == nil then
            goto continue
        end
        if not vim.tbl_contains(ignore_bufs, filetype) then
            return
        end
        ::continue::
    end

    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].buftype == "terminal" then
            goto exit
        end
    end

    ::exit::
    vim.cmd("q!")
end

--- Switch to insert mode after enter terminal
local function terminal_enter_with_insert()
    if vim.bo.buftype ~= "terminal" then
        return
    end
    vim.cmd("startinsert")
end

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.api.nvim_create_user_command("OpenTerminal",             open_terminal, { })
vim.api.nvim_create_user_command("OpenTerminalHorizontally", open_terminal_horizontally, { })
vim.api.nvim_create_user_command("OpenTerminalVertically",   open_terminal_vertically, { })
vim.api.nvim_create_autocmd("WinClosed",  { pattern = "*", callback = terminal_closed_on_last })
vim.api.nvim_create_autocmd("WinEnter",   { pattern = "*", callback = terminal_enter_with_insert })
