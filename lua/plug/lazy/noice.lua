local colors = require("theme.scheme."..nvim.setting.appearance.theme).color

return
{
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
        require('noice').setup(
        {
            presets =
            {
		        lsp_doc_border = true
	        },
            hover =
            {
                enabled = true,
                silent = false,
                view = nil,
                opts = {},
            },
        })
        require('notify').setup(
        {
            background_colour = colors.background,
        })
    end,
    dependencies =
    {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
