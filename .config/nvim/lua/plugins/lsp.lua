return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neodev.nvim", opts = {} },
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate", -- :MasonUpdate updates registry contents
      opts = {
        automatic_installation = true,
        ui = {
          border = 'rounded'
        }
      },
    },
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "j-hui/fidget.nvim", config = true, tag = "legacy" },
  },
  config = function ()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/lsps', [[v:val =~ '\.lua$']])) do
      local server = file:gsub('%.lua$', '')
      local opts = require('lsps.'..server)
      opts.capabilities = capabilities
      lspconfig[server].setup(opts)
    end

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', 'éd', vim.diagnostic.goto_prev, {desc="Previous Diagnostic"})
    vim.keymap.set('n', 'èd', vim.diagnostic.goto_next, {desc="Next Diagnostic"})

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
  end
}
