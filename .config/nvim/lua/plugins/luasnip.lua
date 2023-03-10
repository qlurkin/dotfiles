return {
  "L3MON4D3/LuaSnip",
  opts = function (_, opts)
    opts.history = false
  end,
  keys = function ()
    return {}
  end
  -- keys = {
  --   {
  --     "<tab>",
  --     function()
  --       print("LuaSnip Tab")
  --       return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
  --     end,
  --     expr = true, silent = true, mode = "i",
  --   },
  --   { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
  --   { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  -- },
}
