local tree = nvim.keymap.tree
local editor = nvim.keymap.editor

nmap(tree.open_tree, ":Ranger<CR>")

-- Convert nvim key to ranger key style
local function to_conf_key(key)
    if key == '<Leader>' then
        return '<Space>'
    end
    return key
end

-- Default keymaps see: https://github.com/ranger/ranger/blob/master/ranger/config/rc.conf
local custom_keymaps = string.format(
[[
set preview_images true
set collapse_preview true
set preview_files true
set preview_script true
set use_preview_script true

copymap <UP>       %s
copymap <DOWN>     %s
copymap <LEFT>     %s
copymap <RIGHT>    %s

map %s         quit
map %s         change_mode normal
map %s         copy mode=toggle
map %s         cut mode=toggle
map %s         paste overwrite=True append=True
map %s         console touch#space
map %s         console mkdir#space
map %s         console rename#space
map %s         console delete 
map %s         tag_toggle
]],
to_conf_key(tree.move_to_prev_item),
to_conf_key(tree.move_to_next_item),
to_conf_key(tree.move_to_parent_folder),
to_conf_key(tree.open),
to_conf_key(tree.close_tree),
to_conf_key(editor.normal_mode),
to_conf_key(tree.copy),
to_conf_key(tree.cut),
to_conf_key(tree.paste),
to_conf_key(tree.create_file),
to_conf_key(tree.create_directory),
to_conf_key(tree.rename),
to_conf_key(tree.delete),
to_conf_key(tree.mark_or_unmark))

return custom_keymaps:gsub([[#space]], [[%%space]])
