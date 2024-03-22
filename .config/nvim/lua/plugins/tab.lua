return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {
        {
          "<C-l>",
          function()
            return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next"
          end,
          expr = true,
          silent = true,
          mode = "i",
        },
        {
          "<C-l>",
          function()
            require("luasnip").jump(1)
          end,
          mode = "s",
        },
        {
          "<C-h>",
          function()
            require("luasnip").jump(-1)
          end,
          mode = { "i", "s" },
        },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
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
  },
}
