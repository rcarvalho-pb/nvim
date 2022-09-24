return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use "EdenEast/nightfox.nvim" -- Packer
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons' -- optional, for file icons

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'onsails/lspkind.nvim'
end)
