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

local common_remap = function (bufnr)
    vim.keymap.set('n', "K", vim.lsp.buf.hover, {buffer = bufnr})
    vim.keymap.set('n', "<leader>sh", vim.lsp.buf.signature_help, {buffer = bufnr})
    vim.keymap.set('n', "gd", vim.lsp.buf.definition, {buffer = bufnr})
    vim.keymap.set('n', "gt", vim.lsp.buf.type_definition, {buffer = bufnr})
    vim.keymap.set('n', "gi", vim.lsp.buf.implementation, {buffer = bufnr})
    vim.keymap.set('n', "gr", '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
    vim.keymap.set('n', "<leader>dj", vim.diagnostic.goto_next, {buffer = bufnr})
    vim.keymap.set('n', "<leader>dk", vim.diagnostic.goto_prev, {buffer = bufnr})
    vim.keymap.set('n', "<leader>dl", '<cmd>Telescope diagnostics<cr>', {buffer = bufnr})
    vim.keymap.set('n', "<leader>r", vim.lsp.buf.rename, {buffer = bufnr})
    vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, {buffer = bufnr})
    vim.keymap.set('n', "<leader>F", function () vim.lsp.buf.format({ async = true }) end, {buffer = bufnr})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python
lsp.pyright.setup({
    capabilities = capabilities,
    on_attach = function ()
        common_remap(0)
    end
})

-- Rust
local rt = require("rust-tools")
rt.setup({
    server = {
        on_attach = function(_, bufnr)
            common_remap(bufnr)
            -- Hover actions
            vim.keymap.set("n", "<leader>ha", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>rca", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})
rt.inlay_hints.enable()

-- Lua
-- lsp.sumneko_lua.setup{
--     settings = {
--       Lua = {
--         runtime = {
--           -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--           version = 'LuaJIT',
--         },
--         diagnostics = {
--           -- Get the language server to recognize the `vim` global
--           globals = {'vim'},
--         },
--         workspace = {
--           -- Make the server aware of Neovim runtime files
--           library = vim.api.nvim_get_runtime_file("", true),
--         },
--         -- Do not send telemetry data containing a randomized but unique identifier
--         telemetry = {
--           enable = false,
--         },
--       },
--     },
--     capabilities = capabilities,
--     on_attach = function ()
--         common_remap(0)
--     end
-- }

-- Javascript
lsp.tsserver.setup({
    capabilities = capabilities,
    on_attach = function ()
        common_remap(0)
    end
})

-- Go
lsp.gopls.setup({
    capabilities = capabilities,
    on_attach = function ()
        common_remap(0)
    end
})

-- html
local html_cap = vim.lsp.protocol.make_client_capabilities()
html_cap.textDocument.completion.completionItem.snippetSupport = true

lsp.html.setup {
    capabilities = html_cap,
    on_attach = function ()
        common_remap(0)
    end

}

lsp.emmet_ls.setup{}
