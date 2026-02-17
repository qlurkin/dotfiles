require("toggleterm").setup({
    open_mapping = [[<C-Enter>]],
    insert_mappings = true,
    terminal_mappings = true,
    direction = 'float',
    float_opts = {
        border = "curved",
        winblend = "0",
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})
