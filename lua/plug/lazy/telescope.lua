return
{
    'nvim-lua/plenary.nvim',
    config = function()
        if nvim.setting.editor.finder ~= "telescope" then
            return
        end
        require('telescope').setup(
        {
            defaults =
            {
                mappings = require("core.keymap.telescope")
            }
        })
    end,
    dependencies =
    {
        'nvim-telescope/telescope.nvim'
    }
}
