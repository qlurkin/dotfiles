require('mason.settings').set({
  ui = {
    border = 'rounded'
  }
})

local lsp = require('lsp-zero')

-- lsp.preset('recommended')
lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


lsp.on_attach(function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, remap = false, desc = desc })
    end

    local tb = require('telescope.builtin')
    nmap("gr", tb.lsp_references, '[G]oto [R]eferences')
    nmap("gj", vim.diagnostic.goto_next, 'Next Diagnostics')
    nmap("gk", vim.diagnostic.goto_prev, 'Previous Diagnostics')
    nmap("gs", tb.lsp_document_symbols, 'Document [S]ymbols')
    nmap('gw', tb.lsp_dynamic_workspace_symbols, '[W]orkspace Symbols')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, { desc = 'Format current buffer with LSP' })
end)


local rust_lsp = lsp.build_options('rust_analyzer', {})

lsp.setup()

-- vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.o.completeopt = 'menu,menuone,noselect,noinsert'

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings()

cmp_mappings['<CR>'] = cmp.mapping(function(fallback)
    fallback()
end,{"i","c"})
cmp_mappings['<Tab>'] = cmp.mapping.confirm({ select = true })
cmp_mappings['<S-Tab>'] = nil

local cmp_config = lsp.defaults.cmp_config({
    window = {
        completion = cmp.config.window.bordered()
    },
    experimental = {
        ghost_text = true
    },
    mapping = cmp_mappings,
})

cmp.setup(cmp_config)

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python
-- lsp.pyright.setup({
--     capabilities = capabilities,
--     on_attach = function ()
--         common_remap(0)
--     end
-- })

-- lsp.jedi_language_server.setup{
--     capabilities = capabilities,
--     on_attach = function ()
--         common_remap(0)
--     end
-- }

-- Rust
local rt = require("rust-tools")
rt.setup({server = rust_lsp})
-- rt.setup({
    -- server = {
    --     on_attach = function(_, bufnr)
    --         common_remap(bufnr)
    --         -- Hover actions
    --         vim.keymap.set("n", "<leader>ha", rt.hover_actions.hover_actions, { buffer = bufnr })
    --         -- Code action groups
    --         vim.keymap.set("n", "<Leader>rca", rt.code_action_group.code_action_group, { buffer = bufnr })
    --     end,
    -- },
-- })
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
-- lsp.tsserver.setup({
--     capabilities = capabilities,
--     on_attach = function ()
--         common_remap(0)
--     end
-- })

-- Go
-- lsp.gopls.setup({
--     capabilities = capabilities,
--     on_attach = function ()
--         common_remap(0)
--     end
-- })

-- html
-- local html_cap = vim.lsp.protocol.make_client_capabilities()
-- html_cap.textDocument.completion.completionItem.snippetSupport = true

-- lsp.html.setup {
--     capabilities = html_cap,
--     on_attach = function ()
--         common_remap(0)
--     end
--
-- }
--
-- lsp.emmet_ls.setup{}
