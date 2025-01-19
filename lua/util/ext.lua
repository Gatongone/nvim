-- Extensions for neovim
nvim.ext =
{
    -- Buffer APIs
    buf =
    {
        -- Get buffer's count
        get_bufs_count = function()
            return vim.fn.bufnr('$')
        end,

        -- Get buffers with varialbe that match var_value
        -- @param var_name: Variable name
        -- @param var_value: Variable value
        -- @return buffers with varialbe that match var_value
        get_bufs_with_var = function(var_name, var_value)
            local bufs = {}
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                if vim.fn.getbufvar(buf, '&'..var_name) == var_value then
                    table.insert(bufs, buf)
                end
            end
            return bufs
        end,

        -- Get current buffer id.
        get_cur_buf_id = function()
            vim.fn.bufnr()
        end,

        -- get buffers
        get_bufs = function()
            return vim.api.nvim_list_bufs()
        end
    },
    -- Tab APIs
    tab =
    {
        -- Get number of tabs
        -- @return Number of tabs
        get_tabs_count = function()
            return vim.fn.bufnr('$')
        end,

        -- Get  name by tab handle
        -- @param id: Tab handle, 0 for current tab
        -- @return Tab name
        get_tab_name = function(id)
            return vim.api.nvim_buf_get_name(id)
        end,

        -- Get tab id by tab name
        -- @param name: Tab name
        -- @return tab handle
        get_tab_id = function(name)
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                local buf_name = vim.api.nvim_buf_get_name(buf)
                if buf_name == name or vim.fn.fnamemodify(buf_name, ":t") == name then
                    return buf
                end
            end
            return nil
        end,

        -- Get current tab id
        -- @return Current tab handle
        get_cur_tab_id = function()
            return vim.api.nvim_tabpage_get_number(0)
        end,

        -- Get current tab name
        -- @return Current tab name
        get_cur_tab_name = function()
            return vim.api.nvim_buf_get_name(0)
        end,
    },
    -- Window APIs
    win =
    {
        -- Get number of windows where in specific tab
        -- @param id: Tab id
        -- @return Number of windows where in specific tab
        get_wins_count = function(id)
            return table.getn(vim.api.nvim_tabpage_list_wins(id))
        end,

        -- Get number of windows where in cur tab
        -- @return number of windows where in cur tab
        get_cur_wins_count = function()
            return vim.fn.winnr('$')
        end,

        -- Get windows where in current tab
        get_cur_win =  function()
            return vim.fn.winnr()
        end,
    }
}
