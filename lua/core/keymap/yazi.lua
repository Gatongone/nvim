local tree = nvim.keymap.tree
local yazi = require("yazi")

yazi.config.forwarded_dds_events = { "MyMessageNoData", "MyMessageWithData" }

nmap(tree.open_tree, ":Yazi<CR>")
