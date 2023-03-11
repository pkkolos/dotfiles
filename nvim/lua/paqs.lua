require "paq" {
    { 'savq/paq-nvim' }, -- Let Paq manage itself

    { 'nathangrigg/vim-beancount', as = 'syntax-beancount' },
    { 'DaeZak/crafttweaker-vim-highlighting', as = 'syntax-crafttweaker' },
    { 'jtratner/vim-flavored-markdown', as = 'syntax-ghmarkdown' },
    { 'tpope/vim-git', as = 'syntax-git' },
    { 'ledger/vim-ledger', as = 'syntax-ledger' },
    { 'tpope/vim-markdown', as = 'syntax-markdown' },
    { 'vim-ruby/vim-ruby', as = 'syntax-ruby' },
    { 'sunaku/vim-ruby-minitest', as = 'syntax-ruby-minitest' },
    { 'rust-lang/rust.vim', as = 'syntax-rust' },
    { 'baskerville/vim-sxhkdrc', as = 'syntax-sxhkdrc' },
    { 'cespare/vim-toml', as = 'syntax-toml' },

    { 'nvim-treesitter/nvim-treesitter', as = 'treesitter', run = function() vim.cmd 'TSUpdate' end },
    { 'airblade/vim-gitgutter', as = 'gitgutter', run = require 'config/gitgutter' },

    { 'qpkorr/vim-bufkill', as = 'bufkill', run = require 'config/bufkill' },
    { 'simnalamburt/vim-mundo', as = 'mundo' },
    { 'tpope/vim-repeat', as = 'repeat' },
    { 'justinmk/vim-sneak', as = 'sneak' },
    { 'tpope/vim-surround', as = 'surround' },
    { 'numToStr/Comment.nvim', as = 'comment', run = require('Comment').setup() },

    { 'crispgm/cmp-beancount', as = 'cmp-beancount' },
    { 'hrsh7th/cmp-buffer', as = 'cmp-buffer' },
    { 'hrsh7th/cmp-cmdline', as = 'cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp', as = 'cmp-lsp' },
    { 'hrsh7th/cmp-nvim-lua', as = 'cmp-lua' },
    { 'hrsh7th/cmp-omni', as = 'cmp-omni' },
    { 'hrsh7th/cmp-path', as = 'cmp-path' },
    { 'hrsh7th/nvim-cmp', as = 'cmp', run = require 'config/cmp' },
    { 'neovim/nvim-lspconfig', as = 'lspconfig', run = require 'config/lspconfig' },
}
