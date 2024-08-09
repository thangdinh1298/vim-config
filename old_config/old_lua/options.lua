local options {
   tabstop = 4,
   softtabstop = 4,
   shiftwidth = 4,
   cursorline = true,
   number = true,
   relativenumber = true,
   incsearch = true,
   hlsearch = true,
   expandtab = true,
   ma = true,
   paste = true,
   splitbelow = true,                    -- force all horizontal splits to go below current window
   splitright = true,                    -- force all vertical splits to go to the right of current window
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
