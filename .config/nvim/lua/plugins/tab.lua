return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {
        {
          "<S-tab>",
          function()
            return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next"
          end,
          expr = true,
          silent = true,
          mode = "i",
        },
        {
          "<S-tab>",
          function()
            require("luasnip").jump(1)
          end,
          mode = "s",
        },
        -- {
        --   "<C-\\>",
        --   function()
        --     return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next"
        --   end,
        --   expr = true,
        --   silent = true,
        --   mode = "i",
        -- },
        -- {
        --   "<C-\\>",
        --   function()
        --     require("luasnip").jump(1)
        --   end,
        --   mode = "s",
        -- },
        -- {
        --   "<C-]>",
        --   function()
        --     require("luasnip").jump(-1)
        --   end,
        --   mode = { "i", "s" },
        -- },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<tab>"] = cmp.mapping.confirm({ select = true }),
        -- ["<S-tab>"] = cmp.mapping.confirm({
        --   behavior = cmp.ConfirmBehavior.Replace,
        --   select = true,
        -- }),
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
