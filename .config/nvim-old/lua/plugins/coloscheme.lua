return {
  {
    "Mofiqul/dracula.nvim",
    opts = {
      -- lualine_bg_color = "#FF0000",
      -- transparent_bg = true,
      overrides = function(colors)
        return {
          -- NormalFloat = { fg = colors.fg, bg = colors.black },
          StatusLine = { fg = colors.white, bg = "#44475a" },
          -- StatusLineTerm = { fg = colors.white, bg = colors.fg_gutter },
        }
      end,
    },
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     style = "moon",
  --     -- transparent = true,
  --   },
  -- },
  --
  -- {
  --   "catppuccin",
  --   opts = {
  --     -- transparent_background = true,
  --   },
  -- },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-frappe",
      colorscheme = "dracula",
      -- colorscheme = "tokyonight",
    },
  },

  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ui = {
  --       border = "rounded",
  --     },
  --   },
  -- },
  --
  -- {
  --   "folke/which-key.nvim",
  --   opts = {
  --     window = {
  --       border = "rounded",
  --     },
  --   },
  -- },
  --
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function()
  --     require("lspconfig.ui.windows").default_options.border = "rounded"
  --   end,
  -- },
}
