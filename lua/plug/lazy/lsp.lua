-- Lsp keymaps
local lsp_keymap       = require("core.keymap.lsp")
local on_client_attach = function(_, bufnr)
    local bmap = function(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    lsp_keymap.setup_lsp(bmap)
end

-- Collect servers and configs
local langs            = require("plug.langs")
local servers          = {}
local configs          = {}

for lang, server in pairs(langs) do
    if server == nil then
        goto continue
    end
    local status, config = pcall(require, "plug.langs." .. lang)
    if status then
        configs[server]  = config
        config.on_attach = on_client_attach
    else
        configs[server] = { on_attach = on_client_attach }
    end
    table.insert(servers, server)
    ::continue::
end

-- Reset window style
local function on_mason_ui_open()
    local win          = vim.api.nvim_get_current_win()
    local opts         = vim.api.nvim_win_get_config(win)
    local default_opts = nvim.ext.win.get_win_config({ title = "LSP Configs" })
    opts.title         = default_opts.title
    opts.title_pos     = default_opts.title_pos
    opts.border        = default_opts.border
    opts.width         = default_opts.width
    opts.height        = default_opts.height
    opts.col           = default_opts.col
    opts.row           = default_opts.row
    vim.api.nvim_win_set_config(win, opts)
end
vim.api.nvim_create_autocmd("FileType", { pattern = "mason", callback = on_mason_ui_open })

return
{
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local confs    = require("mason-lspconfig")
            local lsp      = require("lspconfig")
            local handlers =
            {
                function(server)
                    lsp[server].setup(configs[server])
                end
            }
            require("mason").setup(
                {
                    ui =
                    {
                        keymaps =
                        {
                            install_package   = "o",
                            uninstall_package = "d"
                        }
                    }
                })
            require("lspsaga").setup(
                {
                    lightbulb = { enable = false },
                    finder =
                    {
                        max_height = 0.6,
                        keys =
                        { toggle_or_open = '<CR>', split = 's' },
                    }
                })
            confs.setup({ ensure_installed = servers })
            confs.setup_handlers(handlers)
            vim.diagnostic.config { float = { border = "rounded" } }
        end,
        dependencies =
        {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "nvimdev/lspsaga.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        }
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            cmp.setup(
                {
                    snippet    =
                    {
                        expand = function(args) vim.fn["vsnip#anonymous"](args.body) end
                    },
                    sources    = cmp.config.sources(
                        {
                            { name = 'nvim_lsp' },
                            { name = 'vsnip' },
                        },
                        {
                            { name = 'buffer' },
                            { name = 'path' }
                        }
                    ),
                    mapping    = cmp.mapping.preset.insert(lsp_keymap.setup_cmp(cmp)),
                    window     =
                    {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                    },
                })
        end,
        dependencies =
        {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'rafamadriz/friendly-snippets',
            'onsails/lspkind-nvim'
        }
    }
}
