--require("mason").setup()
--require("mason-lspconfig").setup()


--require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
--    function (server_name) -- default handler (optional)
--        require("lspconfig")[server_name].setup {}
--    end
--}

local lsp = require('lspconfig')

local border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"│", "FloatBorder"},
      {"╯", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"│", "FloatBorder"},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

servers = {
    'pyright',
    'rust_analyzer'
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, server in ipairs(servers) do
    lsp[server].setup({
        capabilities = capabilities,
        on_attach = function ()
            vim.keymap.set('n', "K", vim.lsp.buf.hover, {buffer = 0})
            vim.keymap.set('n', "<leader>sh", vim.lsp.buf.signature_help, {buffer = 0})
            vim.keymap.set('n', "gd", vim.lsp.buf.definition, {buffer = 0})
            vim.keymap.set('n', "gt", vim.lsp.buf.type_definition, {buffer = 0})
            vim.keymap.set('n', "gi", vim.lsp.buf.implementation, {buffer = 0})
            vim.keymap.set('n', "gr", '<cmd>Telescope lsp_references<cr>', {buffer = 0})
            vim.keymap.set('n', "<leader>dj", vim.diagnostic.goto_next, {buffer = 0})
            vim.keymap.set('n', "<leader>dk", vim.diagnostic.goto_prev, {buffer = 0})
            vim.keymap.set('n', "<leader>dl", '<cmd>Telescope diagnostics<cr>', {buffer = 0})
            vim.keymap.set('n', "<leader>r", vim.lsp.buf.rename, {buffer = 0})
            vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, {buffer = 0})
            vim.keymap.set('n', "<leader>F", function () vim.lsp.buf.format({ async = true }) end, {buffer = 0})
        end
    })
end
