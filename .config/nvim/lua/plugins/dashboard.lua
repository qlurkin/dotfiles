return {
  "glepnir/dashboard-nvim",
  opts = function(_, opts)
    local logo = [[
██╗     ██╗   ██╗██████╗ ██╗   ██╗██╗███╗   ███╗
██║     ██║   ██║██╔══██╗██║   ██║██║████╗ ████║
██║     ██║   ██║██████╔╝██║   ██║██║██╔████╔██║
██║     ██║   ██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗╚██████╔╝██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝ ╚═════╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
[Powered by LazyVim]
    ]]

    logo = string.rep("\n", 5) .. logo .. "\n\n"

    opts.config.header = vim.split(logo, "\n")
  end,
}
