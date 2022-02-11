local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }
local nmap = function(before,after)
    map('n',before,after,opt)
end
local imap = function(before,after)
    map('i',before,after,opt)
end
local vmap = function(before,after)
    map('v',before,after,opt)
end
local tmap = function(before,after)
    map('t',before,after,opt)
end
local xmap = function(before,after)
    map('x',before,after,opt)
end

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nop
nmap('s','<nop>')
nmap('F','<nop>')
nmap('gh','<nop>')
nmap('a', '<nop>')

-- 缩进
imap('<C-j>','<C-D>')
imap('<C-l>','<C-T>')
imap('<S-Tab>','<C-D>')
vmap('<Tab>','>gv')
vmap('<C-l>','>gv')
vmap('<C-j>','<gv')


-- 光标移动
nmap('i','k')
nmap('k','j')
nmap('j','h')
nmap('I','10k')
nmap('K','10j')
vmap('i','k')
vmap('k','j')
vmap('j','h')
vmap('I','10k')
vmap('K','10j')
imap('<A-i>','<Up>')
imap('<A-k>','<Down>')
imap('<A-j>','<Left>')
imap('<A-l>','<Right>')

-- 快速选择
nmap('b','<C-q>')
nmap('<C-a>','ggvG')
vmap('e','$')
vmap('q','^')
nmap('L','0v$')
vmap('L','0$')
vmap("<A-i>", ":move '<-2<CR>gv-gv")
vmap("<A-k>", ":move '>+1<CR>gv-gv")


-- 切换模式
nmap('<esc>','a')
nmap('q','I')
nmap('e','A')

-- 退出和保存
nmap('<C-s>',':w<CR>')
nmap('<C-q>',':q!<CR>')
imap('<C-s>','<esc>:w<CR>')
imap('<C-q>','<esc>:q!<CR>')
vmap('<C-s>','<esc>:w<CR>')
vmap('<C-q>','<esc>:q!<CR>')

-- 宏记录
nmap('R','qa')
nmap('h','@a')

-- 搜索
nmap(']','n')
nmap('[','N')
nmap('<LEADER><CR>',':nohlsearch<CR>')
nmap('<C-r>',':%s/')

-- 分屏
nmap( "sh", ":vsp<CR>")
nmap( "sv", ":split<CR>")
nmap( "<A-j>", "<C-w>h")
nmap( "<A-l>", "<C-w>l")
nmap( "<A-k>", "<C-w>j")
nmap( "<A-i>", "<C-w>k")
nmap( "<C-j>", ":vertical resize -1<CR>")
nmap( "<C-l>", ":vertical resize +1<CR>")
nmap( "<C-k>", ":resize +1<CR>")
nmap( "<C-i>", ":resize -1<CR>")


-- 自动补全
imap('"','""<esc>i')
imap("'","''<esc>i")
imap('(','()<esc>i')
imap("[","[]<esc>i")
imap("{","{}<esc>i")


-- 标签页
nmap( "t", ":tabe<CR>")
nmap( "<A-q>", ":-tabnext<CR>")
nmap( "<A-e>", ":+tabnext<CR>")

-- 终端
tmap("<esc>","<C-N>")
tmap("<C-q>","<C-d><CR>")
tmap('<C-q>',[[<C-\><C-n>:Lspsaga close_floaterm<cr>]])
nmap('<C-t>',":Lspsaga open_floaterm<cr>")
nmap("T",":e term://$SHELL<CR>")
nmap("stv",":split term://$SHELL<CR>")
nmap("sth",":vs term://$SHELL<CR>")

-- 快速对齐
vmap("<LEADER>a",":EasyAlign<Space>")

-- 代码格式化
nmap("<LEADER>f",":Autoformat<CR>")

-- 代码指令
nmap('ga',":Lspsaga code_action<cr>")
xmap('ga',":<c-u>Lspsaga range_code_action<cr>")

-- 查找光标下单词的字定义和引用
nmap('gw',":Lspsaga lsp_finder<cr>")

-- 查找成员
nmap('gm',":Lspsaga hover_doc<cr>")
--nmap('<C-l>',"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
--nmap('<C-j>',"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")

-- 查看帮助文档
nmap('gh',":Lspsaga signature_help<cr>")

-- 重命名
nmap('gr',":Lspsaga rename<cr>")

-- 查询定义
nmap('gd',":Lspsaga preview_definition<cr>")

-- 浮动窗口

-- 显示诊断
nmap('go',"<cmd>Lspsaga show_cursor_diagnostics<cr>")
nmap('gj',"<cmd>Lspsaga diagnostic_jump_prev<cr>")
nmap('gl',"<cmd>Lspsaga diagnostic_jump_next<cr>")

-- lsp
local pluginKeys = {}


-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
    mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    -- code action
    mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    -- go xx
    --mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    --mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
    --mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    --mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    --mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    -- diagnostic
    --mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>')
    --mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    --mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')
    -- leader + =
    --mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
end

pluginKeys.cmp = function(cmp)
    return {
        -- 上一个
        ['<C-j>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<C-l>'] = cmp.mapping.select_next_item(),
        ['`'] = cmp.mapping.select_next_item(),
        -- 出现补全
        ['<C-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- 取消
        ['<C-,>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = cmp.mapping.confirm({
            select = true ,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    }
end
return pluginKeys
