local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'hotwatermorning/auto-git-diff'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'neovim/nvim-lspconfig' -- lsp functionalities
Plug 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' -- Snippets plugin
Plug 'hrsh7th/nvim-cmp' -- Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
Plug 'machakann/vim-sandwich' -- surreound brackets
Plug 'mfussenegger/nvim-dap' -- Debugger adapter
vim.call('plug#end')
