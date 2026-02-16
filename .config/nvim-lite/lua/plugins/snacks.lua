return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = {
      replace_netrw = true, -- Replace netrw with the snacks explorer
      trash = true,         -- Use the system trash when deleting files
    },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = {
      configure = true,
    },
    picker = { enabled = true },
    notifier = { enabled = true, timeout = 3000, },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    styles = {
      notification = {}
    },
    terminal = {
      win = { style = "terminal" },
    },
  },
  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>b",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>?",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>cc",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>d",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "-",
      function()
        Snacks.explorer({
          -- focus = "explorer",
          auto_close = true,
          layout = {
            preset = "default",
            preview = true
          },
          win = {
            list = {
              keys = {
                ["o"] = "explorer_add",
              }
            }
          }
        })
      end,
      desc = "File Explorer"
    },
    { "<leader>gg", function() Snacks.lazygit() end,              desc = "Lazygit" },
    { "<leader>n",  function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<c-/>",      function() Snacks.terminal() end,             desc = "Toggle Terminal" },
  },
}
