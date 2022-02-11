-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- swap
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false



-- line style
vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.cursorline = true
--vim.wo.signcolumn = "yes"

-- vim.wo.colorcolumn = "80"
vim.o.termguicolors = true
vim.opt.termguicolors = true
vim.o.background = "dark"

-- terminal theme
vim.cmd([[colorscheme gruvbox]])
vim.cmd("hi Normal ctermfg=252 ctermbg=None guibg=None")


-- tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- seach
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- complete
vim.o.wildmenu = true

-- auto update
vim.o.autoread = true
vim.bo.autoread = true

