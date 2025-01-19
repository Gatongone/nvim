local tab = nvim.keymap.tab

nmap(tab.prev_tab,      ':-tabnext<CR>')
nmap(tab.next_tab,      ':+tabnext<CR>')
nmap(tab.close_tab,     ':tabclose<CR>')
vmap(tab.prev_tab,      ':-tabnext<CR>')
vmap(tab.next_tab,      ':+tabnext<CR>')
vmap(tab.close_tab,     ':tabclose<CR>')
