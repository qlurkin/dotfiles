return {
  "goolord/alpha-nvim",
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
    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
  end,
}
