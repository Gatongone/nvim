return
{
    'nvim-lua/plenary.nvim',
    config = function()
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
