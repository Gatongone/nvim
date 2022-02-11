--Audo download packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://codechina.csdn.net/mirrors/wbthomason/packer.nvim.git', install_path})
	vim.cmd 'packadd packer.nvim'
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

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
        use "folke/lsp-colors.nvim"
        use 'onsails/lspkind-nvim'
        use { 'tami5/lspsaga.nvim', branch = 'nvim6.0' or 'nvim51' }
        -- vsnip
        use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
        use 'hrsh7th/vim-vsnip'
        use 'rafamadriz/friendly-snippets'
        -- defx (files manager;windows choose)
        use {"Shougo/defx.nvim",requires = {"kristijanhusak/defx-icons","t9md/vim-choosewin"}}
        use "roxma/vim-hug-neovim-rpc"
        use "roxma/nvim-yarp"
        -- ranger
        use "kevinhwang91/rnvimr"
        -- 中文输入法
        use "ZSaberLv0/ZFVimIM"
        use "ZSaberLv0/ZFVimJob"
        use "Gatongone/ZFVimIM_pinyin_base"
        use "ZSaberLv0/ZFVimIM_openapi"
        use "ZSaberLv0/ZFVimGitUtil"
    	-- 代码注释
        use "b3nj5m1n/kommentary"
        use "JoosepAlviste/nvim-ts-context-commentstring"
        use {"nvim-treesitter/nvim-treesitter",run = ':TSUpdate'}
        -- vim surround
        use "tpope/vim-surround"
        -- 快速对齐
        use "junegunn/vim-easy-align"
        -- markdown 编辑
        use "iamcco/markdown-preview.nvim"
        use "mzlogin/vim-markdown-toc"
        use "dhruvasagar/vim-table-mode"
        -- 函数列表
        use "liuchengxu/vista.vim"
        -- 代码格式化
        use "Chiel92/vim-autoformat"
        -- 文件查询
        use "brooth/far.vim"
        -- 模糊查询
        use {"junegunn/fzf.vim", requires = {"junegunn/fzf"}, run = function() vim.fn["fzf#install"]() end}

    end,
    config =
    {
        clone_timeout =  180,
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

