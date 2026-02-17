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
