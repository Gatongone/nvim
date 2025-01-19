local tree = nvim.keymap.tree

-- Keymappings
nmap(tree.open_tree, ":NetrwOpenFileTree<CR>")
local netrw_mapping = function()
    bnmap(tree.close_tree,                 ":NetrwCloseFileTree<CR>")
    bnmap(tree.move_to_prev_item,          "<Up>")
    bnmap(tree.move_to_next_item,          "<Down>")
    bnmap(tree.move_to_parent_folder,      ":NetrwExitDirectory<CR>")
    bnmap(tree.mark_or_unmark,             "mf")
    bnmap(tree.open,                       ":NetrwOpenFileOrDirectory<CR>")
    bnmap(tree.cut,                        ":NetrwCutFile<CR>")
    bnmap(tree.copy,                       ":NetrwCopyFile<CR>")
    bnmap(tree.paste,                      ":NetrwPasteFile<CR>")
    bnmap(tree.delete,                     ":NetrwRemoveRecursive<CR>")
    bnmap(tree.rename,                     "R")
    bnmap(tree.create_file,                ":NetrwCreateFile<CR>")
    bnmap(tree.create_directory,           ":NetrwCreateDirectory<CR>")
end
vim.api.nvim_create_autocmd("FileType", { pattern = "netrw", callback = netrw_mapping })
