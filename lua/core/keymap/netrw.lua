local explore = nvim.keymap.explore
local win  = nvim.keymap.win

-- Keymappings
nmap(explore.open_explore, ":NetrwOpenFileTree<CR>")
local netrw_mapping = function()
    bnmap(win.resize_vwin_bigger,        ":vertical resize +1<CR>")
    bnmap(win.resize_vwin_smaller,       ":vertical resize -1<CR>")
    bnmap(win.resize_hwin_bigger,        ":horizontal resize +1<CR>")
    bnmap(win.resize_hwin_smaller,       ":horizontal resize -1<CR>")
    bnmap(win.focus_left_win,            ":wincmd h<CR>")
    bnmap(win.focus_right_win,           ":wincmd l<CR>")
    bnmap(win.focus_up_win,              ":wincmd k<CR>")
    bnmap(win.focus_down_win,            ":wincmd j<CR>")
    bnmap(explore.close_explore,         ":NetrwCloseFileTree<CR>")
    bnmap(explore.move_to_prev_item,     "<Up>")
    bnmap(explore.move_to_next_item,     "<Down>")
    bnmap(explore.move_to_parent_folder, ":NetrwExitDirectory<CR>")
    bnmap(explore.mark_or_unmark,        "mf")
    bnmap(explore.open,                  ":NetrwOpenFileOrDirectory<CR>")
    bnmap(explore.cut,                   ":NetrwCutFile<CR>")
    bnmap(explore.copy,                  ":NetrwCopyFile<CR>")
    bnmap(explore.paste,                 ":NetrwPasteFile<CR>")
    bnmap(explore.delete,                ":NetrwRemoveRecursive<CR>")
    bnmap(explore.rename,                ":NetrwRename<CR>")
    bnmap(explore.create_file,           ":NetrwCreateFile<CR>")
    bnmap(explore.create_directory,      ":NetrwCreateDirectory<CR>")
end
vim.api.nvim_create_autocmd("FileType", { pattern = "netrw", callback = netrw_mapping })
