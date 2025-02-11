local terminal = nvim.keymap.terminal
nmap(terminal.open_terminal,            ":OpenTerminal<CR>")
nmap(terminal.open_terminal_horizontal, ":OpenTerminalHorizontally<CR>")
nmap(terminal.open_terminal_vertical,   ":OpenTerminalVertically<CR>")
tmap(nvim.keymap.editor.normal_mode,    [[<C-\><C-n>]])
