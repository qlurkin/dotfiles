return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
 ██╗     ██╗   ██╗██████╗ ██╗   ██╗██╗███╗   ███╗
 ██║     ██║   ██║██╔══██╗██║   ██║██║████╗ ████║
 ██║     ██║   ██║██████╔╝██║   ██║██║██╔████╔██║
 ██║     ██║   ██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║
 ███████╗╚██████╔╝██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚══════╝ ╚═════╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
 [Powered by LazyVim]
  ]],
      },
      sections = {
        {
          section = "terminal",
          cmd = "spriteget -w 50 --height 30 --author",
          random = 10,
          ttl = 60,
          indent = 0,
          height = 30,
        },
        { section = "header", pane = 2 },
        { section = "keys", pane = 2, gap = 1, padding = 1 },
        { section = "startup", pane = 2 },
      },
    },
    explorer = {
      replace_netrw = true,
      trash = true,
    },
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          layout = {
            preset = "default",
            preview = true,
          },
          win = {
            list = {
              keys = {
                ["o"] = "explorer_add",
              },
            },
          },
        },
      },
    },
  },
  keys = {
    {
      "-",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    {
      "<leader>bb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Find Buffer",
    },
    {
      "<leader>cc",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },
    {
      "<leader>dd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
  },
}
