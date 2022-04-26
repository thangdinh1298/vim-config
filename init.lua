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

--Fzf
keymap('n', '<leader>f', ':Files<cr>', opt)
keymap('n', '<leader>F', ':Ag<cr>', opt)

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
Plug 'simrat39/rust-tools.nvim' -- type inlay
vim.call('plug#end')

-- Coloscheme
vim.cmd('colorscheme snazzy')

-- SETTING UP LSPCONFIG
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local diags_opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', diags_opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', diags_opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', diags_opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', diags_opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', diags_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', diags_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', diags_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', diags_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', diags_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', diags_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', diags_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', diags_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', diags_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', diags_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', diags_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', diags_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', diags_opts)
end

--require'lspconfig'.rust_analyzer.setup{
--    on_attach = on_attach,
--    flags = {
--      -- This will be the default in neovim 0.7+
--      debounce_text_changes = 150,
--    }
--}

-- SETTING UP rust_tools
-- NOTE: For rust development, instead of setting up lspconfig, we pass the server configs to rust-tools and it will
-- pass it on to the lsp. If we are not doing rust dev, comment this and uncomment lspconfig lines above
require('rust-tools').setup({
    server = {
        on_attach = on_attach,
        flags = {
          -- This will be the default in neovim 0.7+
          debounce_text_changes = 150,
        }
    }
})
