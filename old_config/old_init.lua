--space and tab
--numbeG of visual spaces per tab--
vim.bo.tabstop = 4

--number of spaces when editing
vim.bo.softtabstop = 4

--size of indent
vim.bo.shiftwidth = 4

--highlight
vim.wo.cursorline = true

--ui config

vim.o.number = true
vim.o.relativenumber = true

--seaching
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.expandtab = true
--Set modifiable
vim.bo.ma = true

--Set paste off for braces completion
vim.o.paste = false

-- Split config
vim.o.splitbelow = true
vim.o.splitright = true

-- KEY MAPPINGS
local keymap = vim.api.nvim_set_keymap
local opt  = { noremap = true }
--turn off hightlight
--map <i> :set nohlsearch<cr>
keymap('n', '<leader><space>', ':nohlsearch<cr>', opt)

-- Windows movement keymap
keymap('n', '<C-h>', '<C-w>h', opt)
keymap('n', '<C-j>', '<C-w>j', opt)
keymap('n', '<C-k>', '<C-w>k', opt)
keymap('n', '<C-l>', '<C-w>l', opt)

--Automatic braces completion
keymap('i', '"', '""<left>', opt)
keymap('i', '\'', '\'\'<left>', opt)
keymap('i', '(', '()<left>', opt)
keymap('i', '[', '[]<left>', opt)
keymap('i', '{', '{}<left>', opt)
keymap('i', '{<CR>', '{<CR>}<ESC>O', opt)
keymap('i', '{;<CR>', '{<CR>};<ESC>O', opt)

-- Split resize
keymap('n', '<leader><left>', ':vertical resize +3<CR>', { noremap = true })
keymap('n', '<leader><right>', ':vertical resize -3<CR>', { noremap = true })
keymap('n', '<leader><up>', ':resize +3<CR>', { noremap = true })
keymap('n', '<leader><down>', ':resize -3<CR>', { noremap = true })

--Fzf
keymap('n', '<leader>f', ':Files<cr>', opt)
keymap('n', '<leader>F', ':Rg<cr>', opt)

--PLUGIN LIST
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'hotwatermorning/auto-git-diff'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'neovim/nvim-lspconfig' -- lsp functionalities
Plug 'hrsh7th/nvim-cmp' -- Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' -- Snippets plugin
Plug 'machakann/vim-sandwich' -- surreound brackets
Plug 'mfussenegger/nvim-dap' -- Debugger adapter
vim.call('plug#end')

-- Coloscheme
vim.cmd('colorscheme snazzy')

--LSP
require('lsp')

--DAP
require('python_dap')

vim.g.termdebugger='/usr/bin/pdb'
