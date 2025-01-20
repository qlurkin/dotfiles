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
          cmd = "dbget -w 50 --height 30 --author; sleep .1",
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
  },
}
