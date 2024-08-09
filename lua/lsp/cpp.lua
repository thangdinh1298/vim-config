local function setup_pylsp(on_attach, capabilities)
   require'lspconfig'.clangd.setup{
      cmd = { "clangd-12" },
      on_attach = on_attach,
      capabilities = capabilities,
   }
end

return setup_pylsp

