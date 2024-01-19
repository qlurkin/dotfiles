return {
  "nvim-treesitter/nvim-treesitter",
  keys = {
    { "<c-space>", desc = "Increment selection" }, -- MacOS use this shorcut. Disable it !
    { "<bs>", desc = "Decrement selection", mode = "x" },
  },
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    ensure_installed = "all",
  },
}
