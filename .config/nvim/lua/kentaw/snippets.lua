local ls = require('luasnip')
local parse = require("luasnip.util.parser").parse_snippet

ls.add_snippets("html", {
    parse({trig="slide", dscr="Deck Slide"}, "<section>\n\t<h2>$1</h2>\n\t$0\n</section>"),
    parse({trig="code", dscr="Highlighted Code"}, "<pre><code class=\"lang-$1\">\n\t$0\n</code></pre>")
})

