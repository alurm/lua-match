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

Tags are implemented by setting the `__call` metamethod on a table. The implementation ([tag.lua](tag.lua)) is so small, I'll just show it here in full:

```lua
return function(tag, value)
  setmetatable(value, {
    __call = function(value, switch)
      local case = switch[tag]
      if case then return case(value) end
      local default = switch[false]
      if default then return default() end
      error('no match for tag ' .. tag)
    end
  })
  return value
end
```

The license used for this project is MIT.
