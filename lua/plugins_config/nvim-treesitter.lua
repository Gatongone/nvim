local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then
  return
end

treesitter.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = false,
    disable = {}
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "html",
    "scss"
  }
}

--已过时
--local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--parser_config.tsx.used_by = {"javascript", "typescript.tsx"}
local parser_config = require "nvim-treesitter.parsers".filetype_to_parsername
parser_config.somef = {"javascript", "typescript.tsx"}
