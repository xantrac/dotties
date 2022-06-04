local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if status_ok then
    capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

settings = {
    solargraph = {
        completion = true,
        autoformat = true,
        diagnostics = true,
        formatting = true,
    }
}

require'lspconfig'.solargraph.setup{
    cmd = { "solargraph", "stdio" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = settings
}
