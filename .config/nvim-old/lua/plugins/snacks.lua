-- local handle = io.popen("echo yop")
-- local result = ""
-- if handle ~= nil then
--   result = handle:read("*a")
--   handle:close()
-- end
-- local output = vim.fn.system({ "python3", "/Users/lur/Program/spriteget/spriteget.py" })
--print(result)
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
          cmd = "dbget -w 50 --height 30 --author",
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
