-- Fork from xiyaowong/transparent.nvim
local M = {}

-- stylua: ignore start
local config =
{
    groups =
    {
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
        'EndOfBuffer', 'NormalFloat', 'NvimTreeNormal', 'FloatBorder', 'TabLineFill',
        'TabLine', 'TabLineSel'
    },
    extra_groups = {},
    exclude_groups = {},
    on_clear = function () end
}
-- stylua: ignore end

function M.set(opts)
    vim.defer_fn(function()
        opts = opts or config

        vim.validate(
        {
            opts = { opts, "t" },
            groups = { opts.groups, "t", true },
            extra_groups = { opts.extra_groups, "t", true },
            exclude_groups = { opts.exclude_groups, "t", true },
            on_clear = { opts.on_clear, "f", true },
        })
        config = vim.tbl_extend("force", config, opts)
    end, 200)
end

return setmetatable(M,
{
    __index = function(_, k)
        return config[k]
    end,
})
