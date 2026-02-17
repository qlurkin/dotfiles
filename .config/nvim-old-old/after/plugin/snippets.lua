local ls = require('luasnip')

ls.config.set_config({
    history = false,
    updateevent = "TextChanged,TextChangedI"
})

vim.keymap.set({'i', 's'}, '<C-j>', function ()
    if ls.jumpable(1) then
        ls.jump(1)
    end
end, {silent = true})

-- Load Snippets From Other Plugins
require("luasnip.loaders.from_vscode").lazy_load()

-- require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })

require('kentaw.snippets')
