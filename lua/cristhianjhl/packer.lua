local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

    -- Themes
    use 'morhetz/gruvbox'
    -- use 'wuelnerdotexe/vim-enfocado'
    -- use 'wuelnerdotexe/nerdterm'
    use 'akinsho/toggleterm.nvim'
    use 'dracula/vim'
    use 'tomasr/molokai'
    use 'sickill/vim-monokai'
    use { 'https://gitlab.com/__tpb/monokai-pro.nvim', as = 'monokai-pro.nvim' }

    -- LSP Settings
    use 'neovim/nvim-lspconfig'                                                     -- Collection of configurations for built-in LSP client
    use 'williamboman/nvim-lsp-installer'                                           -- Automatically install language servers to stdpath
    use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }           -- Snippet Engine and Snippet Expansion
    use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }               -- Autocompletion
    -- use 'saadparwaiz1/cmp_luasnip
    -- use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-path'

    -- Telescope Settings
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {{'nvim-lua/plenary.nvim'}}}
    use 'BurntSushi/ripgrep'
    use 'sharkdp/fd'
    use 'kyazdani42/nvim-web-devicons'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- Git Commands on NVIM
    use 'mhinz/vim-signify'
    use 'tpope/vim-fugitive'                                                        -- Git commands in nvim
    use 'tpope/vim-rhubarb'                                                         -- Fugitive-companion to interact with github
    use 'junegunn/gv.vim'
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }       -- Add git related info in the signs columns and popups

    -- Comments
    use 'numToStr/Comment.nvim'                                                     -- "gc" to comment visual regions/lines
    use 'lukas-reineke/indent-blankline.nvim'                                       -- Add indentation guides even on blank lines

    -- STATUS LINE
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    
    -- AIRLINE
    -- use 'vim-airline/vim-airline'
    -- use 'vim-airline/vim-airline-themes'

    use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
    
    -- PHP Pluging
    use 'stephpy/vim-php-cs-fixer' 
    use 'arnaud-lb/vim-php-namespace'

    -- JavaScript Plugings
    use 'mxw/vim-jsx'
    use 'pangloss/vim-javascript'
    -- use 'w0rp/ale'
    use 'dense-analysis/ale'
    use 'jose-elias-alvarez/null-ls.nvim'
    use { 'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins' }
    use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production', branch = 'release/0.x' }
    -- use 'MunifTanjim/prettier.nvim'

    use 'laytan/cloak.nvim'

    if is_bootstrap then
        require('packer').sync()
    end
end)

