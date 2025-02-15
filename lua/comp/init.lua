-- File explore implementation
local explore = nvim.setting.editor.explore
local succeed = false
if explore == "yazi" and vim.fn.executable("yazi") then
    succeed = pcall(require, "comp.yazi")
elseif explore == "ranger" and vim.fn.executable("ranger") then
    succeed = pcall(require, "comp.ranger")
end

if not succeed or explore == 'netrw' then
    require("comp.netrw")
end

require("comp.terminal")
require("comp.jmpword")
require("comp.runner")
