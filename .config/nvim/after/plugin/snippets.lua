local ls = require('luasnip')
local parse = require("luasnip.util.parser").parse_snippet

ls.config.set_config({
    history = false,
    updateevent = "TextChanged,TextChangedI"
})

vim.keymap.set({'i', 's'}, '<C-j>', function ()
    if ls.jumpable(1) then
        ls.jump(1)
    end
end, {silent = true})

ls.add_snippets("html", {
    parse("slide", "<section>\n   <h2>$1</h2>\n   $0\n</section>\n")
    parse("code", "<pre><code class=\"lang-$1\">\n   $0</code></pre>\n")
})

