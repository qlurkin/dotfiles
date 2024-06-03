return {
  {
    "nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
        ["<S-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      })
    end,
    keys = {
      {
        "<Tab>",
        function()
          return "<Tab>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<S-Tab>",
        function()
          return "<S-Tab>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<C-l>",
        function()
          return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<C-h>",
        function()
          return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
    },
  },
}
