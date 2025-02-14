local default_win_opts =
{
    anchor    = 'NW',
    title     = '',
    title_pos = 'center',
    relative  = 'win',
    width     = 0.7,
    height    = 0.6,
    focusable = true,
    bufpos    = nil,
    border    = 'rounded',
    style     = 'minimal',
    zindex    = 1,
    noautocmd = false,
}

local appearance = nvim.setting.appearance

--- Extensions for neovim
nvim.ext =
{
    --- UI APIS
    ui =
    {
        --- Get screen row
        --- @param ratio number The ratio of screen height
        --- @return number row 
        get_screen_row = function(ratio)
            local ui = vim.api.nvim_list_uis()[1]

            if ratio ~= nil and ratio < 1 then
                return ui.height * ratio
            end
            return ui.height
        end,

        --- Get screen col
        --- @param ratio number The ratio of screen width
        --- @return number col
        get_screen_col = function(ratio)
            local ui = vim.api.nvim_list_uis()[1]

            if ratio ~= nil and ratio < 1 then
                return ui.width * ratio
            end
            return ui.width
        end
    },

    --- Buffer APIs
    buf =
    {
        --- Get buffer's count
        --- @return number count Buffers count
        get_bufs_count = function()
            return vim.fn.bufnr('$')
        end,

        --- Get buffers with varialbe that match var_value
        --- @param var_name string Variable name
        --- @param var_value any Variable value
        --- @return table buffers Buffers with varialbe that match var_value
        get_bufs_with_var = function(var_name, var_value)
            local bufs = {}
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                if vim.fn.getbufvar(buf, '&'..var_name) == var_value then
                    table.insert(bufs, buf)
                end
            end
            return bufs
        end,

        --- Get current buffer id.
        get_cur_buf_id = function()
            vim.fn.bufnr()
        end,

        --- get buffers
        get_bufs = function()
            return vim.api.nvim_list_bufs()
        end
    },

    --- Tab APIs
    tab =
    {
        --- Get number of tabs
        --- @return number count Number of tabs
        get_tabs_count = function()
            return vim.fn.bufnr('$')
        end,

        --- Get  name by tab handle
        --- @param id number Tab handle, 0 for current tab
        --- @return string tabname Tab name
        get_tab_name = function(id)
            return vim.api.nvim_buf_get_name(id)
        end,

        --- Get tab id by tab name
        --- @param name string Tab name
        --- @return number tab handle
        get_tab_id = function(name)
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                local buf_name = vim.api.nvim_buf_get_name(buf)
                if buf_name == name or vim.fn.fnamemodify(buf_name, ":t") == name then
                    return buf
                end
            end
            return -1
        end,

        --- Get current tab id
        --- @return number tabid Current tab handle
        get_cur_tab_id = function()
            return vim.api.nvim_tabpage_get_number(0)
        end,

        --- Get current tab name
        --- @return string tabname Current tab name
        get_cur_tab_name = function()
            return vim.api.nvim_buf_get_name(0)
        end,
    },

    --- Window APIs
    win =
    {
        --- Get number of windows where in specific tab
        --- @param id number Tab id
        --- @return number tabid Numbers of windows where in specific tab
        get_wins_count = function(id)
            return #vim.api.nvim_tabpage_list_wins(id)
        end,

        --- Get number of windows where in cur tab
        --- @return number count Numbers of windows where in cur tab
        get_cur_wins_count = function()
            return vim.fn.winnr('$')
        end,

        -- Get windows where in current tab
        --- @return number winnr Window id
        get_cur_win =  function()
            return vim.fn.winnr()
        end,

        --- Create a float window
        --- @param enter boolean Whether focus on the window after it created
        --- @param opts table|nil See https://neovim.io/doc/user/api.html#nvim_open_win()
        --- @return table winconfig with window info: {bufnr: number, winnr: number, title: window title}
        create_win = function(enter, opts)
            local win         = {}
            local focus       = enter == nil or enter == true
            local useropts = nvim.ext.win.get_win_config(opts)
            win.title = opts.title
            win.bufnr = vim.api.nvim_create_buf(false, false)
            win.winnr = vim.api.nvim_open_win(win.bufnr, focus, useropts)
            return win
        end,

        --- Get window properties that expand with default config
        --- @param opts table|nil See https://neovim.io/doc/user/api.html#nvim_open_win()
        --- @return table opts Options that expand with default config
        get_win_config = function(opts)
            opts = opts or {}
            local ui = vim.api.nvim_list_uis()[1]
            if opts.width and opts.width < 1 then
                opts.width = math.floor(ui.width * opts.width)
            end
            if opts.height and opts.height < 1 then
                opts.height = math.floor(ui.height * opts.height)
            end
            opts.width = opts.width or math.min(ui.width - 10, math.floor(ui.width / 1.5))
            opts.height = opts.height or math.min(ui.height - 10, math.floor(ui.height / 1.3))
            opts.row = opts.row or math.floor((ui.height - opts.height) / 2.5)
            opts.col = opts.col or math.floor((ui.width - opts.width) / 2)
            opts = vim.tbl_extend("force", default_win_opts, opts)
            if type(opts.title) == 'string' and opts.title ~= ''  then
                opts.title = " "..opts.title.." "
            end
            return opts
        end
    }
}

--- Check if element contains in table
--- @param self table
--- @param element any
--- @return boolean contains
table.contains = function(self, element)
    for _, value in pairs(self) do
        if element == value then
            return true
        end
    end
    return false
end

--- Convert string to array
--- @param self string
--- @return table array
string.toarray = function(self)
    local result = {}
    for i = 1, #self do
        result[i] = string.sub(self, i, i)
    end
    return result
end
