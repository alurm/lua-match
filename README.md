# Minimalistic sum types and switches for Lua

How? With a tagging function.

A minimal usage example:

```lua
local tag = dofile'tag.lua'
local a_rectangle = tag('rectangle', { width = 10, height = 20 })

local switch = {
  rectangle = function(s) return print('Got a rectangle shape with the width of ' .. s.width) end,
  -- An optional default case.
  [false] = function() return print('Shape type is not known') end,
}

-- Will print "Got a rectangle shape with the width of 10".
a_rectangle(switch)
```

For a more thorough example, see [example.lua](example.lua).

Tags are implemented by setting the `__call` metamethod on a table.

License: MIT.
