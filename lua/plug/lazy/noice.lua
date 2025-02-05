local colors = require("theme.scheme." .. nvim.setting.appearance.theme).color

local lsp_opts =
{
    lsp =
    {
        progress =
        {
            enabled = true,
            format  =
            {
                {
                    "",
                    key = "progress.percentage",
                    contents = { { "{data.progress.message} " } },
                },
                "({data.progress.percentage}%) ",
                { "{spinner} ",              hl_group = "NoiceLspProgressSpinner" },
                { "{data.progress.title} ",  hl_group = "NoiceLspProgressTitle" },
                { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
            }
        }
    },
    cmdline =
    {
        format = { cmdline = { title = ' Command ' } },
    },
    presets =
    {
        lsp_doc_border = true
    },
    hover =
    {
        enabled = true,
        silent  = false,
        view    = nil,
        opts    = {},
    },
}

return
{
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
        require('noice').setup(lsp_opts)
        require('notify').setup({ background_colour = colors.background })
    end,
    dependencies =
    {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
