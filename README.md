# Minimalistic sum types and switches for Lua

How? With a tagging function.

A minimal usage example:

```lua
local tag = dofile'tag.lua'
local a_square = tag('square', { width = 10, height = 20 })

local switch = {
  square = function(s) return print('Got a square shape with the width of ' .. s.width) end,
  -- An optional default case.
  [false] = function() return print('Shape type is not known') end,
}

a_square(switch)
```

For a more thorough example, see [example.lua](example.lua).

License: MIT.
