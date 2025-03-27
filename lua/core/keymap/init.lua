local map  = vim.keymap.set
local opt  = {noremap = true, silent = true }
bnmap = function(before, after)
    vim.cmd("nnoremap <silent><buffer> ".. before .. " " .. after)
end
bvmap = function(before, after)
    vim.cmd("vnoremap <silent><buffer> ".. before .. " " .. after)
end
nmap = function(before, after)
    map('n',before,after,opt)
end
imap = function(before, after)
    map('i',before,after,opt)
end
vmap = function(before, after)
    map('v',before,after,opt)
end
tmap = function(before, after)
    map('t',before,after,opt)
end
xmap = function(before, after)
    map('x',before,after,opt)
end

require("core.keymap.editor")
require("core.keymap.tab")
require("core.keymap.win")
require("core.keymap.translate")
