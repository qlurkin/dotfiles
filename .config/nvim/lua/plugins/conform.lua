-- local format_config = {
--   timeout_ms = 500,
--   lsp_fallback = true,
-- }

return {
  {
    "stevearc/conform.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    -- cmd = { "ConformInfo" },
    -- keys = {
    --   {
    --     "<leader>cf",
    --     function()
    --       require("conform").format(format_config)
    --     end,
    --     mode = { "n", "v" },
    --     desc = "Format Code",
    --   },
    -- },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
      },
      -- format_on_save = format_config,
    },
  },
}
