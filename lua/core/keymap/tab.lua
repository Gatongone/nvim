local tab = nvim.keymap.tab

nmap(tab.prev_tab,      ':-tabnext<CR>')
nmap(tab.next_tab,      ':+tabnext<CR>')
vmap(tab.prev_tab,      ':-tabnext<CR>')
vmap(tab.next_tab,      ':+tabnext<CR>')
