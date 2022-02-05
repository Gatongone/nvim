local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- direction key
map('n','i','k',opt)
map('n','k','j',opt)
map('n','j','h',opt)
map('v','i','k',opt)
map('v','k','j',opt)
map('v','j','h',opt) 

-- switch insert mode

map('n','<esc>','a',opt)

map('n','q','I',opt)
map('n','e','A',opt)

-- quit or save
map('n','s','<nop>',opt)
map('n','<C-s>',':w<CR>',opt)
map('n','<C-q>',':q<CR>',opt)
vim.cmd("map <C-r> :source $MYVIMRC<CR>")

-- search
map('n',']','n',opt)
map('n','[','N',opt)
map('n','<LEADER><CR>',':nohlsearch<CR>',opt)

-- windows split
map("n", "s", ":vsp<CR>", opt)
map("n", "<A-j>", "<C-w>h", opt)
map("n", "<A-l>", "<C-w>l", opt)
map("n", "<A-i>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<C-=>", ":vertical resize +10<CR>", opt)
map("n", "<C-->", ":vertical resize -10<CR>", opt)
--map("n", "<C-]>", ":resize +10<CR>",opt)
--map("n", "<C-[>", ":resize -10<CR>",opt)



-- label
map("n", "t", ":tabe<CR>",opt)
map("n", "<A-q>", ":-tabnext<CR>", opt)
map("n", "<A-e>", ":+tabnext<CR>", opt)


-- lsp
local pluginKeys = {}


-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
  mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  -- code action
  mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  -- go xx
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- diagnostic
  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- leader + =
  mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt) 
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

pluginKeys.cmp = function(cmp)
  return {
    -- 上一个
    ['<C-j>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<C-l>'] = cmp.mapping.select_next_item(),
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

