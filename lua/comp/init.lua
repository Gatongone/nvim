-- File tree implementation
local tree    = nvim.setting.editor.tree
local succeed = false
if tree == "yazi" and vim.fn.executable("yazi") then
    succeed = pcall(require, "comp.yazi")
elseif tree == "ranger" and vim.fn.executable("ranger") then
    succeed = pcall(require, "comp.ranger")
end

if not succeed or tree == 'netrw' then
    require("comp.netrw")
end
