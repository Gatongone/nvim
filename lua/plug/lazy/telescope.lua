require("core.keymap.telescope")
return
{
    'nvim-lua/plenary.nvim',
    config = function()
        local editor = nvim.keymap.editor
        local action = require('telescope.actions')
        local function combine(key, prekey)
            if prekey == "Alt" then
                return "<A-" .. key .. ">"
            end
            if prekey == "Ctrl" then
                return "<C-" .. key .. ">"
            end
            return key
        end
        require('telescope').setup(
        {
            defaults =
            {
                mappings =
                {
                    i =
                    {
                        ["<Tab>"]                             = action.toggle_selection,
                        [combine(editor.normal_up, "Alt")]    = action.move_selection_previous,
                        [combine(editor.normal_down, "Alt")]  = action.move_selection_next,
                        [combine(editor.normal_right, "Alt")] = action.select_default,
                        [editor.close]                        = action.close,
                    },
                    n =
                    {
                        ["<Esc>"]             = action.nop,
                        ["<Tab>"]             = action.toggle_selection,
                        ["<Space>"]           = action.toggle_selection,
                        [editor.normal_up]    = action.move_selection_previous,
                        [editor.normal_down]  = action.move_selection_next,
                        [editor.normal_right] = action.select_default,
                        [editor.close]        = action.close,
                    }
                }
            }
        })
    end,
    dependencies =
    {
        'nvim-telescope/telescope.nvim'
    }
}
