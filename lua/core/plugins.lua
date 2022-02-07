--Audo download packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://codechina.csdn.net/mirrors/wbthomason/packer.nvim.git', install_path})
	vim.cmd 'packadd packer.nvim'
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

--config require
require('lsp.setup')
require('lsp.nvim-cmp')

-- Packer startup
return require('packer').startup({
    function()
        -- Packer 
        use 'wbthomason/packer.nvim'
        -- airline
        use {"vim-airline/vim-airline",requires = {"vim-airline/vim-airline-themes","ryanoasis/vim-devicons"}}
        -- Theme
        use {"ellisonleao/gruvbox.nvim",requires = {"rktjmp/lush.nvim"}}
        -- lsp
        use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
        -- nvim-cmp
        use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
        use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
        use 'hrsh7th/cmp-path'     -- { name = 'path' }
        use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
        use 'hrsh7th/nvim-cmp'
        -- vsnip
        use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
        use 'hrsh7th/vim-vsnip'
        use 'rafamadriz/friendly-snippets'
        -- lspkind
        use 'onsails/lspkind-nvim'
        -- defx (files manager;windows choose)
        use {"Shougo/defx.nvim",requires = {"kristijanhusak/defx-icons","t9md/vim-choosewin"}}
        use "roxma/vim-hug-neovim-rpc"
        use "roxma/nvim-yarp"
        -- ranger
        use "kevinhwang91/rnvimr"

    end,
    config =
    {
        max_jobs = 16,
        git = 
        {
            default_url_farmat = 'https://hub.fastgit.org/%s'
        },
        display =
        {
            open_fn = function()
                return require('packer.util').float({border = 'single'})
            end
        }
    }
})

