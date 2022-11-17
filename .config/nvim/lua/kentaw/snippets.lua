local ls = require('luasnip')
local parse = require("luasnip.util.parser").parse_snippet

ls.add_snippets("html", {
    parse({trig="slide", dscr="Deck Slide"}, "<section>\n\t<h2>$1</h2>\n\t$0\n</section>"),
    parse({trig="code", dscr="Highlighted Code"}, "<pre><code class=\"lang-$1\">\n\t$0\n</code></pre>")
})

function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
