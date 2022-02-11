local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "sv",
    split = "sh",
    quit = "q",
    scroll_down = "l",
    scroll_up = "j",
  },
  code_action_keys = {
    quit = "q",
    exec = "<cr>",
  },
  rename_action_keys = {
    quit = "q",
    exec = "<cr>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
}
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }
local nmap = function(before,after)
    map('n',before,after,opt)
end
local tmap = function(before,after)
    map('t',before,after,opt)
end
local xmap = function(before,after)
    map('x',before,after,opt)
end


-- 代码指令
nmap('ga',":Lspsaga code_action<cr>")
xmap('ga',":<c-u>Lspsaga range_code_action<cr>")

-- 查找光标下单词的字定义和引用
nmap('gw',":Lspsaga lsp_finder<cr>")

-- 查找成员
nmap('gm',":Lspsaga hover_doc<cr>")
--nmap('<C-l>',"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
--nmap('<C-j>',"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")

--查看帮助文档
nmap('gh',":Lspsaga signature_help<cr>")

--重命名
nmap('gr',":Lspsaga rename<cr>")

-- 查询定义
nmap('gd',":Lspsaga preview_definition<cr>")

-- 浮动窗口
nmap('<C-t>',":Lspsaga open_floaterm<cr>")
tmap('<C-q>',[[<C-\><C-n>:Lspsaga close_floaterm<cr>]])

-- 显示诊断
nmap('go',"<cmd>Lspsaga show_cursor_diagnostics<cr>")
nmap('gj',"<cmd>Lspsaga diagnostic_jump_prev<cr>")
nmap('gl',"<cmd>Lspsaga diagnostic_jump_next<cr>")
