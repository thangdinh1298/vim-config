local opt  = { noremap = true }
local keymap = vim.keymap.set

-- turn off hightlight
-- map <i> :set nohlsearch<cr>
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

-- Fzf
keymap('n', '<leader>f', ':Files<cr>', opt)
keymap('n', '<leader>F', ':Rg<cr>', opt)

-- DAP
keymap('n', '<F5>', function() require('dap').continue() end)
keymap('n', '<F10>', function() require('dap').step_over() end)
keymap('n', '<F11>', function() require('dap').step_into() end)
keymap('n', '<F12>', function() require('dap').step_out() end)
keymap('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
keymap('n', '<Leader>B', function() require('dap').set_breakpoint() end)
keymap('n', '<Leader>dr', function() require('dap').repl.open() end)
