local function setup_pylsp(on_attach, capabilities)
   require'lspconfig'.pylsp.setup {
     settings = {
       -- configure plugins in pylsp
       pylsp = {
         -- these plugins needs to be installed with pip in the venv
         plugins = {
           -- linters
           pyflakes = {enabled = false},
           pylint = {enabled = true,
                     executable = os.getenv("VIRTUAL_ENV") ..'/bin/pylint',
                     args = {'--rcfile=/ktx/thang/src/.pylintrc'}},
           pycodestyle = {enabled=false},
           -- Type checker
           pylsp_mypy = { enabled = true }
         },
       },
     },
     on_attach = on_attach, --has to be after settings
     capabilities = capabilities,
   }
end

return setup_pylsp
