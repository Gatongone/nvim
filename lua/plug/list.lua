local list =
{
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({})
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local langs     = require("plug.lsp")
            for lang, alias in pairs(langs) do
                local status, setting = pcall(require, "plug.langs."..lang)
                if status == false then
                    setting = { }
                end
                lspconfig[alias].setup(setting)
            end
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require('lspsaga').setup({})
        end,
        dependencies =
        {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        }
    },
}
if nvim.setting.editor.tree == 'yazi' then
    table.insert(list, { "mikavilpas/yazi.nvim" })
end
return list
