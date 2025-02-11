local tree = nvim.keymap.tree
local win  = nvim.keymap.win

-- Keymappings
nmap(tree.open_tree, ":NetrwOpenFileTree<CR>")
local netrw_mapping = function()
    bnmap(win.resize_vwin_bigger,     ":vertical resize +1<CR>")
    bnmap(win.resize_vwin_smaller,    ":vertical resize -1<CR>")
    bnmap(win.resize_hwin_bigger,     ":horizontal resize +1<CR>")
    bnmap(win.resize_hwin_smaller,    ":horizontal resize -1<CR>")
    bnmap(win.focus_left_win,         ":wincmd h<CR>")
    bnmap(win.focus_right_win,        ":wincmd l<CR>")
    bnmap(win.focus_up_win,           ":wincmd k<CR>")
    bnmap(win.focus_down_win,         ":wincmd j<CR>")
    bnmap(tree.close_tree,            ":NetrwCloseFileTree<CR>")
    bnmap(tree.move_to_prev_item,     "<Up>")
    bnmap(tree.move_to_next_item,     "<Down>")
    bnmap(tree.move_to_parent_folder, ":NetrwExitDirectory<CR>")
    bnmap(tree.mark_or_unmark,        "mf")
    bnmap(tree.open,                  ":NetrwOpenFileOrDirectory<CR>")
    bnmap(tree.cut,                   ":NetrwCutFile<CR>")
    bnmap(tree.copy,                  ":NetrwCopyFile<CR>")
    bnmap(tree.paste,                 ":NetrwPasteFile<CR>")
    bnmap(tree.delete,                ":NetrwRemoveRecursive<CR>")
    bnmap(tree.rename,                "R")
    bnmap(tree.create_file,           ":NetrwCreateFile<CR>")
    bnmap(tree.create_directory,      ":NetrwCreateDirectory<CR>")
end
vim.api.nvim_create_autocmd("FileType", { pattern = "netrw", callback = netrw_mapping })
